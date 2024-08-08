import 'package:first/src/constant/colors.dart';
import 'package:first/src/features/expenses/controller/expense_controller.dart';
import 'package:first/src/features/expenses/model/expense_model.dart';
import 'package:first/src/features/works/controller/work_controller.dart';
import 'package:first/src/features/works/model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widget/custom_text.dart';



class Uploadedwork extends StatelessWidget {
  final WorkController workController = Get.find<WorkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<WorkModel>>(
        stream: workController.getwork(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final work = snapshot.data;

          if (work == null || work.isEmpty) {
            return Center(child: Text('No Expense found.'));
          }

          return ListView.builder(
            itemCount: work.length,
            itemBuilder: (context, index) {
              final works = work[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Same as background for the soft effect
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(works.date, 18, primaryColor),
                            TextButton(onPressed: (){}, child: Text('Edit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        CustomText(works.workTitle, 25, primaryColor),
                        CustomText(works.companyName, 15, Colors.grey),
                        SizedBox(height: 10,),
                        CustomText(works.workDescription, 16, primaryColor),
                        SizedBox(height: 10,),
                        CustomText(works.fileUrl, 15, Colors.grey),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}





















