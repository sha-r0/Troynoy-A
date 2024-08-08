import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../model/attendenceModel/attendnceModel.dart';

class AttendenceController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rx<Attendncemodel?> attendanceData = Rx<Attendncemodel?>(null);
  Rx<File?> pickedImage = Rx<File?>(null);
  Rx<String?> currentDate = Rx<String?>(null);
  Rx<String?> currentTime = Rx<String?>(null);
  Rx<String?> address = Rx<String?>(null);
  Rx<Position?> currentPosition = Rx<Position?>(null);


  ///-------------------------------- fetch time ---------------------//////
  var time = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    fetchDateAndTime();
    fetchTime();
    startTimer();
  }

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
  ///-------------------------------- fetch time ---------------------//////

  ///-------------------------------- open camera ---------------------//////
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
  ///-------------------------------- open camera ---------------------//////

  ///-------------------------------- get current location---------------------//////
  Future<void> _getCurrentLocation() async {
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
      address.value = "${place?.name ?? ''}, ${place?.subThoroughfare ?? ''} ${place?.thoroughfare ?? ''}, ${place?.subLocality ?? ''}, ${place?.locality ?? ''}, ${place?.administrativeArea ?? ''} ${place?.postalCode ?? ''}, ${place?.country ?? ''}";
      print(address.value);
    } catch (e) {
      print("Error getting location: $e");
    }
  }
  ///-------------------------------- get current location---------------------//////


  var checkIn = '---/---'.obs;
  var checkOut = '---/---'.obs;

  void uploadattendence()async{
  DocumentSnapshot snap2 = await FirebaseFirestore.instance
      .collection('Attendences')
      .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
      .get();
    final todayDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final currentTime = DateFormat('hh:mm').format(DateTime.now());

    try {
      // Fetch the document from Firestore
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection('Attendences')
          .doc(todayDate)
          .get();

      // If document exists, update 'Check Out'
      if (snap2.exists) {
        checkIn.value = snap2['Check In'];
        checkOut.value = currentTime;
        await FirebaseFirestore.instance
            .collection('Attendences')
            .doc(todayDate)
            .update({
          'Check In': checkIn.value,
          'Check Out': checkOut.value,
        });
      } else {
        // If document does not exist, create it with 'Check In'
        checkIn.value = currentTime;
        await FirebaseFirestore.instance
            .collection('Attendences')
            .doc(todayDate)
            .set({
          'Check In': checkIn.value,
          'Check Out': checkOut.value,
        });
      }
    } catch (e) {
      // Handle errors, such as connectivity issues
      print("Error uploading attendance: $e");
    }

  }



  // Fetch current date and time
  void fetchDateAndTime() {
    currentDate.value = DateFormat('dd MMMM yyyy').format(DateTime.now());
    currentTime.value = DateFormat('HH:mm:ss').format(DateTime.now());
  }

}


