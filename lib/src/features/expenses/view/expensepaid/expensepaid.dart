import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_widget/custom_text.dart';
import '../../model/expense_model.dart';

class Expensepaid extends StatelessWidget {
 Expensepaid({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Color(0xFF13322A),
              child: Container(
                height: 230,
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
                        CustomText('Me', 16, Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText('Date :', 16, Colors.white),
                        CustomText('12-02-2024', 16, Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText('Purpose :', 16, Colors.white),
                        CustomText('Petrol', 16, Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText('Amount :', 16, Colors.white),
                        CustomText('210', 16, Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText('Status :', 16, Colors.white),
                        CustomText('Status :', 16, Colors.green),
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