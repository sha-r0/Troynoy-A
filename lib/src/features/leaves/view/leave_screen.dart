import 'package:first/src/features/leaves/view/takeLeave/take_leave.dart';
import 'package:first/src/features/leaves/view/viewLeave/view_leave.dart';
import 'package:flutter/material.dart';
import 'leavestatus/Leave_status.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading:  IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),),
          backgroundColor: Color(0xFF13322A),
          title: Text(
            'Leave',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white, // Background color of the TabBar
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'View Leave',
                  ),
                  Tab(
                    text: 'Take Leave',
                  ),
                  Tab(
                    text: 'Leave Stats',
                  )
                ],
                // Customize indicator color
                labelColor: Colors.black, // Customize selected tab text color
                unselectedLabelColor:
                Colors.grey[400], // Customize unselected tab text color
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            View_leave(),
            Take_leave(),
            LeaveStatus(),
          ],
        ),
      ),
    );
  }
}




