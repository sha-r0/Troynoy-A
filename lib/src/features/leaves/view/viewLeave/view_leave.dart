import 'package:first/src/features/leaves/controller/leave_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text.dart';

class View_leave extends StatelessWidget {
  View_leave({
    super.key,
  });

  final LeaveController leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: leaveController.getLeave(),
        builder: (context ,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final leaves = snapshot.data;

          if (leaves == null || leaves.isEmpty) {
            return Center(child: Text('No Leave found.'));
          }
          return ListView.builder(
            itemCount: leaves.length,
              itemBuilder: (context ,index){
              final leave = leaves[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          shadowColor: Color(0xFF13322A),
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            decoration: BoxDecoration(
                                color: Color(0xFF13322A),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText('Leave Type :', 16, Colors.white),
                                    CustomText(leave.purpose, 16, Colors.grey),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Divider(
                                  height: 0, // thickness of the divider line
                                  color: Colors.white.withOpacity(0.5), // color of the divider line
                                ),

                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText('Leave From :', 16, Colors.white),
                                    CustomText(leave.fromDate, 16, Colors.grey),
                                    CustomText('To', 16, Colors.white),
                                    CustomText(leave.toDate, 16, Colors.grey),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Divider(
                                  height: 0, // thickness of the divider line
                                  color: Colors.white.withOpacity(0.5), // color of the divider line
                                ),

                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText('Resume On :', 16, Colors.white),
                                    CustomText(leave.resumeDate, 16, Colors.grey),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              );
              });
        });
  }
}