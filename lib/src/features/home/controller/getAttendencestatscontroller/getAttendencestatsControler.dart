import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceStatsController extends GetxController {
  final firestore = FirebaseFirestore.instance;


  @override
  void onInit() {
    super.onInit();
    calculateAllAttendances();
  }

  var noOfPresent = 0.obs;
  var noOfAbsent = 0.obs;
  var noOfHalfday = 0.obs;

  Future<void> calculateAllAttendances() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Attendences')
          .get();

      // Initialize counters
      noOfPresent.value = 0;
      noOfAbsent.value = 0;
      noOfHalfday.value = 0;

      for (var doc in snapshot.docs) {
        final checkInString = doc['Check In'] as String?;
        final checkOutString = doc['Check Out'] as String?;

        if (checkInString != null && checkOutString != null) {
          try {
            // Log the raw time strings for debugging
            print('Check In String: $checkInString');
            print('Check Out String: $checkOutString');

            // Format 'HH:mm:ss' — adjust as needed
            final DateFormat timeFormatter = DateFormat('HH:mm:ss');

            // Create DateTime objects
            final DateTime now = DateTime.now();
            final DateTime checkInDateTime = DateTime(
                now.year,
                now.month,
                now.day,
                timeFormatter.parse(checkInString).hour,
                timeFormatter.parse(checkInString).minute,
                timeFormatter.parse(checkInString).second
            );
            final DateTime checkOutDateTime = DateTime(
                now.year,
                now.month,
                now.day,
                timeFormatter.parse(checkOutString).hour,
                timeFormatter.parse(checkOutString).minute,
                timeFormatter.parse(checkOutString).second
            );

            // Calculate the difference in hours
            final duration = checkOutDateTime.difference(checkInDateTime);
            final noOfHours = duration.inHours.toDouble();

            int check = int.parse(checkInString);
            print(check);
            // Determine attendance status and update counters
            if (checkInString == '9:40:00') {
              noOfPresent.value++;
            } else if (noOfHours >= 4) {
              noOfHalfday.value++;
            } else if (noOfHours == 0) {
              noOfAbsent.value++;
            }

          } catch (formatException) {
            print('Date Format Error: ${formatException.toString()}');
          }
        } else {
          print('Check-in or Check-out time is missing for document ${doc.id}');
        }
      }

      // Print final counts
      print('Total Present: ${noOfPresent.value}');
      print('Total Absent: ${noOfAbsent.value}');
      print('Total Halfday: ${noOfHalfday.value}');

    } catch (e) {
      print('Error retrieving attendances: $e');
    }
  }
}
