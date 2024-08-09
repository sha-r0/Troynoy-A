import 'package:first/src/features/expenses/controller/expense_controller.dart';
import 'package:first/src/features/works/controller/work_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../expenses/view/expense_screen.dart';
import '../../../leaves/view/leave_screen.dart';
import '../../../sitevisit/view/site_visit_screen.dart';
import '../../../works/view/work/work_screen.dart';


class Floatingbutton extends StatelessWidget {
Floatingbutton({
    super.key,
  });

final WorkController workController = Get.put(WorkController());
final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Color(0xff13322A),
      foregroundColor: Colors.white,
      spacing: 15,
      spaceBetweenChildren: 15,
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      activeIcon: Icons.close,
      child: Icon(Icons.add),
      icon: Icons.close,
      useRotationAnimation: true,
      curve: Curves.bounceInOut,
      animationDuration: Duration(milliseconds: 10),
      children: [
        SpeedDialChild(
            child: Icon(Icons.work),
            shape: CircleBorder(),
            label: 'Work',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkScreen()));
            }),
        SpeedDialChild(
            child: Icon(Icons.money),
            shape: CircleBorder(),
            label: 'Expense',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpanseScreen()));
            }),
        SpeedDialChild(
            child: Icon(Icons.directions_walk),
            shape: CircleBorder(),
            label: 'Site Visit',
            onTap: () {
              Get.to(SiteVisitScreen());
            }),
        SpeedDialChild(
            child: Icon(Icons.remove),
            shape: CircleBorder(),
            label: 'Leave',
            onTap: () {
              Get.to(LeaveScreen());
            }),
      ],
    );
  }
}