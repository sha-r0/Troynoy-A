import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../common_widget/custom_text.dart';

class AttendenceHistoryScreen extends StatefulWidget {
  const AttendenceHistoryScreen({super.key});

  @override
  State<AttendenceHistoryScreen> createState() =>
      _AttendenceHistoryScreenState();
}

class _AttendenceHistoryScreenState extends State<AttendenceHistoryScreen> {

  final DateTime _focusedDay = DateTime.now();
  final DateTime _firstDay = DateTime.utc(2000, 01, 01);
  final DateTime _lastDay = DateTime.utc(2050, 12, 01);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF13322A),
          title: Text(
            'Attendence History',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      children: [
                        Icon(Icons.arrow_right,color: Colors.green,),
                        CustomText('Present', 15,Colors.black),
                        CustomText('20', 20, Colors.green)
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      children: [
                        Icon(Icons.arrow_right,color: Colors.red,),
                        CustomText('Absent', 15,Colors.black),
                        CustomText('20', 20, Colors.red)
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      children: [
                        Icon(Icons.arrow_right,color: Colors.yellow,),
                        CustomText('Late', 15,Colors.black),
                        CustomText('20', 20, Colors.yellow)
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      children: [
                        Icon(Icons.arrow_right,color: Colors.blue,),
                        CustomText('Present', 15,Colors.black),
                        CustomText('20', 20, Colors.blue)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TableCalendar(
              onDaySelected: (selected_dat, focusedDay) {
                _History(selected_dat);
                print('Selected Date: $selected_dat');
              },
              availableGestures: AvailableGestures.all,
              locale: "en_us",
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.black,
                ),
                disabledTextStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              focusedDay: _focusedDay,
              firstDay: _firstDay,
              lastDay: _lastDay,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, focusedDay) {
                  final decoration = _getDecoration(date);
                  return Container(
                    decoration: decoration,
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: decoration == null ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                todayBuilder: (context, date, focusedDay) {
                  final decoration = _getDecoration(date);
                  return Container(
                    decoration: decoration?.copyWith(
                      border: Border.all(color: Colors.blue, width: 2),
                    ) ?? BoxDecoration(),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: decoration == null ? Colors.blue : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, focusedDay) {
                  final decoration = _getDecoration(date);
                  return Container(
                    decoration: decoration?.copyWith(
                      border: Border.all(color: Colors.orange, width: 2),
                    ) ?? BoxDecoration(),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: decoration == null ? Colors.orange : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],)
    );
  }

  _History(DateTime selected_dat) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomText('Attendence Record', 15, Color(0xFF13322A)),
              Icon(Icons.person,size: 100,), // Replace with your image URL or AssetImage
              ListTile(
                leading: Icon(Icons.signal_wifi_statusbar_4_bar,color: Colors.green,),
                title: CustomText('Thursday,01 feb 2024', 15, Colors.black),
              ),
              ListTile(
                leading: Icon(Icons.punch_clock,color: Colors.green,),
                title: CustomText('Thursday,01 feb 2024', 15, Colors.black),
              ),
              ListTile(
                leading: Icon(Icons.location_city,color: Colors.green,),
                title: CustomText('Faridabad', 15, Colors.black),
              ),
              ListTile(
                leading: Icon(Icons.lock_clock_outlined,color: Colors.green,),
                title: CustomText('Thursday,01 feb 2024', 15, Colors.black),
              )
            ],
          ),
        );
      },
    );
  }

  // Map to store the status for each day
  final Map<DateTime, String> _dayConditions = {
    DateTime.utc(2024, 07, 12): 'Late',
    // Add more conditions here
    DateTime.utc(2024, 07, 13): 'Absent',
    DateTime.utc(2024, 07, 14): 'Present',
    DateTime.utc(2024, 07, 15): 'Halfday',
  };

  // Function to determine the style based on the condition
  BoxDecoration? _getDecoration(DateTime date) {
    final condition = _dayConditions[date];
    if (condition == null) return null;

    switch (condition) {
      case 'Late':
        return BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
        );
      case 'Absent':
        return BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        );
      case 'Present':
        return BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        );
      case 'Halfday':
        return BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        );
      default:
        return null;
    }
  }
}
