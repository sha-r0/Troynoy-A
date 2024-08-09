import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../model/attendenceModel/attendnceModel.dart';

class AttendenceController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rx<Attendncemodel?> attendanceData = Rx<Attendncemodel?>(null);
  Rx<File?> pickedImage = Rx<File?>(null);
  Rx<String?> currentDate = Rx<String?>(null);
  Rx<String?> currentTime = Rx<String?>(null);
  Rx<String?> address = Rx<String?>(null);
  Rx<Position?> currentPosition = Rx<Position?>(null);

  RxBool isCheckedIn = false.obs; // To track check-IN status
  RxBool isCheckedOut = false.obs; // To track check-OUT status
  RxBool isButtonVisible = true.obs; // To track button visibility

  var checkIn = '---/---'.obs;
  var checkOut = '---/---'.obs;
  var checkInAddress = '---/---'.obs;
  var checkOutAddress = '---/---'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDateAndTime();
    fetchTime();
    startTimer();
    checkCurrentStatus();// Check current status on init
  }

  var time = ''.obs;
  Timer? _timer;


  
  void fetchTime() {
    time.value = DateFormat('HH:mm:ss').format(DateTime.now());
  }

  void startTimer() {
    DateTime currentTime = DateFormat('HH:mm:ss').parse(time.value);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime = currentTime.add(Duration(seconds: 1));
      time.value = DateFormat('HH:mm:ss').format(currentTime);
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> openCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? cameraImage = await picker.pickImage(source: ImageSource.camera);
      if (cameraImage == null) return;
      pickedImage.value = File(cameraImage.path);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _getCurrentLocation(Rx<String> location) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark? place = placemarks.isNotEmpty ? placemarks[0] : null;

      currentPosition.value = position;
      location.value = "${place?.name ?? ''}, ${place?.subThoroughfare ?? ''} ${place?.thoroughfare ?? ''}, ${place?.subLocality ?? ''}, ${place?.locality ?? ''}, ${place?.administrativeArea ?? ''} ${place?.postalCode ?? ''}, ${place?.country ?? ''}";
      print(location.value);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> uploadattendence() async {
    final todayDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    try {
      await openCamera();
      await _getCurrentLocation(checkInAddress);

      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection('Attendences')
          .doc(todayDate)
          .get();

      if (snap2.exists) {
        // Document exists, update check-out time and address
        if (isCheckedIn.value && !isCheckedOut.value) {
          checkIn.value = snap2['Check In'];
          checkOut.value = currentTime;
          await FirebaseFirestore.instance
              .collection('Attendences')
              .doc(todayDate)
              .update({
            'Check Out': checkOut.value,
            'Check Out Address': checkInAddress.value ?? 'Not Available',
          });
          isCheckedIn.value = false; // Toggle the state
          isCheckedOut.value = true; // Update check-out status
          isButtonVisible.value = false; // Hide button after check-out
        }
      } else {
        // Document does not exist, create it with check-in time and address
        if (!isCheckedIn.value) {
          checkIn.value = currentTime;
          await FirebaseFirestore.instance
              .collection('Attendences')
              .doc(todayDate)
              .set({
            'Check In': checkIn.value,
            'Check Out': '---/---', // Initial check-out is null
            'Check In Address': checkInAddress.value ?? 'Not Available',
            'Check Out Address': '---/---', // Initial check-out address is null
          });
          isCheckedIn.value = true; // Toggle the state
          isButtonVisible.value = true; // Show button after check-in
        }
      }
    } catch (e) {
      print("Error uploading attendance: $e");
    }
  }


  void fetchDateAndTime() {
    currentDate.value = DateFormat('dd MMMM yyyy').format(DateTime.now());
    currentTime.value = DateFormat('HH:mm:ss').format(DateTime.now());
  }

  void checkCurrentStatus() async {
    final todayDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    try {
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection('Attendences')
          .doc(todayDate)
          .get();

      if (snap2.exists) {
        // Document exists, check status
        final checkInValue = snap2['Check In'] ?? '---/---';
        final checkOutValue = snap2['Check Out'] ?? '---/---';

        checkIn.value = checkInValue;
        checkOut.value = checkOutValue;

        isCheckedIn.value = checkInValue != '---/---' && checkOutValue == '---/---'; // Checked in but not checked out
        isCheckedOut.value = checkOutValue != '---/---'; // Checked out
        isButtonVisible.value = !isCheckedOut.value; // Hide button if checked out
      } else {
        checkIn.value = '---/---';
        checkOut.value = '---/---';
        isCheckedIn.value = false;
        isCheckedOut.value = false;
        isButtonVisible.value = true; // Show button if not checked in
      }
    } catch (e) {
      print("Error checking current status: $e");
    }
  }

}

