import 'package:first/src/features/expenses/controller/expense_controller.dart';
import 'package:first/src/features/expenses/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/custom_text.dart';


class Expenseview extends StatelessWidget {
  final ExpenseController expenseController = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ExpenseModel>>(
        stream: expenseController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final expenses = snapshot.data;

          if (expenses == null || expenses.isEmpty) {
            return Center(child: Text('No Expense found.'));
          }

          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                elevation: 10,
                shadowColor: Color(0xFF13322A),
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Color(0xFF13322A),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText('Expense By', 16, Colors.white),
                          CustomText(
                              expense!.expenseby, 16, Colors.grey),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 0, // thickness of the divider line
                        color: Colors.white.withOpacity(
                            0.5), // color of the divider line
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText('Date :', 16, Colors.white),
                          CustomText(
                              expense!.date, 16, Colors.grey),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 0, // thickness of the divider line
                        color: Colors.white.withOpacity(
                            0.5), // color of the divider line
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText('Purpose :', 16, Colors.white),
                          CustomText(
                              expense!.purpose, 16, Colors.grey),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 0, // thickness of the divider line
                        color: Colors.white.withOpacity(
                            0.5), // color of the divider line
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText('Amount :', 16, Colors.white),
                          CustomText(
                              expense!.amount, 16, Colors.grey),
                        ],
                      ),
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






















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../common_widget/custom_text.dart';
// import '../../model/expense_model.dart';
//
// class Expenseview extends StatelessWidget {
//    Expenseview({
//     super.key
//
//   });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child:
//       ListView.builder(
//           itemCount: 1
//           itemBuilder: (context, index) {
//             return isLoading
//                 ? Center(child: CircularProgressIndicator(),)
//                 : Card(
//               elevation: 10,
//               shadowColor: Color(0xFF13322A),
//               child: Container(
//                 height: 230,
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 decoration: BoxDecoration(
//                     color: Color(0xFF13322A),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText('Expense By', 16, Colors.white),
//                         CustomText(
//                             expensemodel!.expenseby, 16, Colors.grey),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Divider(
//                       height: 0, // thickness of the divider line
//                       color: Colors.white.withOpacity(
//                           0.5), // color of the divider line
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText('Date :', 16, Colors.white),
//                         CustomText(
//                             expensemodel!.date, 16, Colors.grey),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Divider(
//                       height: 0, // thickness of the divider line
//                       color: Colors.white.withOpacity(
//                           0.5), // color of the divider line
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText('Purpose :', 16, Colors.white),
//                         CustomText(
//                             expensemodel!.purpose, 16, Colors.grey),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Divider(
//                       height: 0, // thickness of the divider line
//                       color: Colors.white.withOpacity(
//                           0.5), // color of the divider line
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText('Amount :', 16, Colors.white),
//                         CustomText(
//                             expensemodel!.amount, 16, Colors.grey),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Divider(
//                       height: 0, // thickness of the divider line
//                       color: Colors.white.withOpacity(
//                           0.5), // color of the divider line
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText('Status :', 16, Colors.white),
//                         CustomText('Unpaid :', 16, Colors.red),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }