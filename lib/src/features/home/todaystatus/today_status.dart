import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/custom_text.dart';

class TodayStatus extends StatelessWidget {
  TodayStatus({
    super.key,
  });
  String CheckIn = '---/---';
  String CheckOut = '---/---';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Today's Status", 20, Color(0xff13322A)),
              ],
            )),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xff13322A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.white.withOpacity(0.5)),
                            SizedBox(width: 8),
                            Text(
                              '08-06-2024',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '06:30',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 45),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                size: 40,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                CheckIn,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.punch_clock,
                                size: 40,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                CheckOut,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Genral 9:30am to 6:00pm',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
