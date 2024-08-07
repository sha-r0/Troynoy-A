import 'package:first/src/features/expenses/controller/expense_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widget/custom_text.dart';
import '../../../../../common_widget/custom_text_feild.dart';


class Workadd extends StatefulWidget {
  Workadd({
    super.key,
  });

  @override
  State<Workadd> createState() => _WorkaddState();
}

class _WorkaddState extends State<Workadd> {
  int currentStepIndex = 0;
  bool _isValid = true;
  String _errorMessage = '';
  final expensebycontroler = TextEditingController();
  final dateController = TextEditingController();
  final purposeController = TextEditingController();
  final amountController = TextEditingController();

  final ExpenseController expenseController = Get.put(ExpenseController());

  void _validateFields() {
    setState(() {
      _isValid = true;
      _errorMessage = '';

      switch (currentStepIndex) {
        case 0:
          if (expensebycontroler.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter your full name';
          } else if (dateController.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter Date';
          } else if (purposeController.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter Purpose of Expense';
          } else if (amountController.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter Amount';
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText('Work :', 18, Color(0xFF13322A)),
            SizedBox(height: 8),
            CustomTextFeilds('Work', expensebycontroler, (value) {
              if (!_isValid &&
                  currentStepIndex == 0 &&
                  expensebycontroler.text.isEmpty) {
                return 'Please enter Work';
              }
              return null;
            }, null, null, null, TextCapitalization.words),
            SizedBox(
              height: 20,
            ),
            CustomText('Date :', 18, Color(0xFF13322A)),
            SizedBox(height: 8),
            CustomTextFeilds(
                'DD/MM/YYYY',
                dateController,
                    (value) {
                  if (!_isValid &&
                      currentStepIndex == 0 &&
                      dateController.text.isEmpty) {
                    return 'Please enter Date';
                  }
                  return null;
                },
                Icons.calendar_month,
                    () {
                  var datepicked = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(3000),
                  ).then((datepicked) {
                    if (datepicked != null) {
                      final formattedDate =
                          "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                      dateController.text = formattedDate;
                    }
                  });
                },
                null,
                TextCapitalization.words),
            SizedBox(
              height: 20,
            ),
            CustomText('Purpose :', 18, Color(0xFF13322A)),
            SizedBox(height: 8),
            CustomTextFeilds('Purpose', purposeController, (value) {
              if (!_isValid &&
                  currentStepIndex == 0 &&
                  purposeController.text.isEmpty) {
                return 'Please enter Purpose of Expense';
              }
              return null;
            }, null, null, null, TextCapitalization.words),
            SizedBox(
              height: 20,
            ),
            CustomText('Amount :', 18, Color(0xFF13322A)),
            SizedBox(height: 8),
            CustomTextFeilds('Amount', amountController, (value) {
              if (!_isValid &&
                  currentStepIndex == 0 &&
                  amountController.text.isEmpty) {
                return 'Please enter Amount';
              }
              return null;
            }, null, null, TextInputType.number, TextCapitalization.words),
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                shadowColor: Color(0xff13322A),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff13322A),
                    ),
                    onPressed: () {
                      _validateFields();
                      if (_isValid) {
                        String Expenseby = expensebycontroler.text;
                        String Date = dateController.text;
                        String purpose = purposeController.text;
                        String amount = amountController.text;
                        // ExpenseModel expensemodel = ExpenseModel(
                        //     expenseby: Expenseby,
                        //     date: Date,
                        //     purpose: purpose,
                        //     amount: amount);
                        // expenseController.addUser(expensemodel);
                        expensebycontroler.clear();
                        dateController.clear();
                        purposeController.clear();
                        amountController.clear();
                      }
                    },
                    child: Text(
                      'Upload Work',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
