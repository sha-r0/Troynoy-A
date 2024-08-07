import 'package:first/src/constant/colors.dart';
import 'package:first/src/features/expenses/view/expenseadds/expense_add.dart';
import 'package:first/src/features/expenses/view/expensepaid/expensepaid.dart';
import 'package:flutter/material.dart';
import '../../../common_widget/custom_text.dart';
import 'expenseview/expense_view.dart';

class ExpanseScreen extends StatefulWidget {
  const ExpanseScreen({super.key});

  @override
  State<ExpanseScreen> createState() => _ExpanseScreenState();
}

class _ExpanseScreenState extends State<ExpanseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: primaryColor,
          title: Text(
            'Expense',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white, // Background color of the TabBar
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Expense',
                  ),
                  Tab(
                    text: 'Add Expense',
                  ),
                  Tab(
                    text: 'Paid Expense',
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
            Expenseview(),
            Expenseadd(),
           Expensepaid()
          ],
        ),
      ),
    );
  }
}


