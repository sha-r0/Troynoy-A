import 'package:first/src/features/home/controller/getAttendencestatscontroller/getAttendencestatsControler.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text.dart';
import '../attendence_history/attendence_history.dart';


class AttendenceStats extends StatelessWidget {
  AttendenceStats({
    super.key,
  });

  final AttendanceStatsController _controller = Get.put(AttendanceStatsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Attendence", 20, Color(0xff13322A)),
                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceScreen()));
                  },
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendenceHistoryScreen()));
                  }, child: CustomText("View All", 20, Color(0xff13322A))),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70, // Fixed width for the pie chart
                    height: 70, // Fixed height for the pie chart
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0, // No space between sections
                        centerSpaceRadius: 25, // No space in the center
                        startDegreeOffset: 0, // Start from 0 degrees
                        borderData: FlBorderData(show: false), // Hide border
                        sections: [
                          PieChartSectionData(
                            color: Color(0xff13322A).withOpacity(0.8),
                            value: 17,
                            radius: 15, // Adjust radius as needed
                            showTitle: false, // Hide title in sections
                          ),
                          PieChartSectionData(
                            color: Colors.yellow,
                            value: 5,
                            radius: 15, // Adjust radius as needed
                            showTitle: false, // Hide title in sections
                          ),
                          PieChartSectionData(
                            color: Colors.red,
                            value: 2,
                            radius: 15, // Adjust radius as needed
                            showTitle: false, // Hide title in sections
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomText('17', 20, Color(0xff235748).withOpacity(0.8)),
                      CustomText('Present', 15, Colors.grey),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText('5', 20, Colors.yellow),
                      CustomText('Late', 15, Colors.grey),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText('2', 20, Colors.red),
                      CustomText('Absent', 15, Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
