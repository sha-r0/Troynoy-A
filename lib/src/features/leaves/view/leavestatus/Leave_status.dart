import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_widget/custom_text.dart';

class LeaveStatus extends StatelessWidget {
  const LeaveStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Color(0xFF13322A),
              child: Container(
                height: 190,
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
                        CustomText('Causal Leave', 16, Colors.grey),
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
                        CustomText('12-04-2023', 16, Colors.grey),
                        CustomText('To', 16, Colors.white),
                        CustomText('12-04-2023', 16, Colors.grey),
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
                        CustomText('14-03-2024', 16, Colors.grey),
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
                        CustomText('Leave Status :', 16, Colors.white),
                        CustomText('Granted', 16, Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}