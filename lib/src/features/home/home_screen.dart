import 'package:first/src/constant/colors.dart';
import 'package:first/src/constant/text_strings.dart';
import 'package:first/src/features/home/navigationdrawer/navigationDrawer.dart';
import 'package:first/src/features/home/todaystatus/today_status.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../common_widget/custom_text.dart';
import 'attendence_stats/attendence_stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=> IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,color: Colors.white,))),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: primaryColor,
        title: Text(
          Troynoya,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Navigationdrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AttendenceStats(),
            SizedBox(height: 15),
            TodayStatus(),

          ],
        ),
      ),
    );
  }
}




