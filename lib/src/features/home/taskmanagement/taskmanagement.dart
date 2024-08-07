import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/custom_text.dart';

class TaskManagement extends StatelessWidget {
  const TaskManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Task Management", 20, Color(0xff13322A)),
                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceScreen()));
                  },
                  child: CustomText("View All", 20, Color(0xff13322A)),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff13322A),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: CustomText('All (5)', 15, Colors.white),
                  ),

                  Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: CustomText("To Do's (2)", 15, Color(0xff13322A)),
                    ),
                  ),

                  Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: CustomText('In Progress (10)', 15, Color(0xff13322A)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Banner(
                message: "Today's Work",
                location: BannerLocation.topStart,
                color: Colors.red,
                child: Card(
                  elevation: 4,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                              leading: Icon(Icons.work),
                              title: CustomText('Home Screen', 20, Colors.black),
                              trailing: Container(
                                padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(7)),
                                    color: Colors.green
                                ),
                                child: CustomText('Done', 15, Colors.white),
                              )
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('View Details',style: TextStyle(color: Color(0xff13322A),fontWeight: FontWeight.bold),),
                                CustomText('Deadline : 5:30 Pm', 12, Colors.red)
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.work),
                            title: CustomText('Home Screen', 20, Colors.black),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(7)),
                                  color: Colors.green
                              ),
                              child: CustomText('Done', 15, Colors.white),
                            )
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View Details',style: TextStyle(color: Color(0xff13322A),fontWeight: FontWeight.bold),),
                              CustomText('Deadline : 5:30 Pm', 12, Colors.red)
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
              Card(
                elevation: 4,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.work),
                            title: CustomText('Home Screen', 20, Colors.black),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(7)),
                                  color: Colors.green
                              ),
                              child: CustomText('Done', 15, Colors.white),
                            )
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View Details',style: TextStyle(color: Color(0xff13322A),fontWeight: FontWeight.bold),),
                              CustomText('Deadline : 5:30 Pm', 12, Colors.red)
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
