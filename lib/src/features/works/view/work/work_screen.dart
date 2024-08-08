import 'package:first/src/features/leaves/view/takeLeave/take_leave.dart';
import 'package:first/src/features/leaves/view/viewLeave/view_leave.dart';
import 'package:first/src/features/works/view/work/workadd/workadd_screen.dart';
import 'package:first/src/features/works/view/work/workdo/uploaded_work.dart';
import 'package:flutter/material.dart';


class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {


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
            'Work',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white, // Background color of the TabBar
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Work Assign',
                  ),
                  Tab(
                    text: 'Add Work',
                  ),
                  Tab(
                    text: 'Uploaded Work',
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
            NeumorphicContainer(),
            Workadd(),
            Uploadedwork()
          ],
        ),
      ),
    );
  }
}




class NeumorphicContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e5ec), // Light background color
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xFFe0e5ec), // Same as background for the soft effect
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: Offset(-5, -5),
                blurRadius: 15,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(5, 5),
                blurRadius: 15,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Neumorphic Container',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




