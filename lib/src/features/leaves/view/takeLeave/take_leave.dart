import 'package:first/src/features/leaves/controller/leave_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text.dart';
import '../../../../common_widget/custom_text_feild.dart';
import '../../model/leave_model.dart';

class Take_leave extends StatefulWidget {
  const Take_leave({
    super.key,
  });

  @override
  State<Take_leave> createState() => _Take_leaveState();
}

class _Take_leaveState extends State<Take_leave> {
  int currentStepIndex = 0;

  bool _isValid = true;

  String _errorMessage = '';

  void _validateFields() {
    setState(() {
      _isValid = true;
      _errorMessage = '';

      switch (currentStepIndex) {
        case 0:
          if (fromdatecontroler.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter From Date';
          } else if (todatecontroler.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter To Date';
          }  else if (leaveapplyforcontroler.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter Purpose of Leave';
          } else if (resumedatecontroler.text.isEmpty) {
            _isValid = false;
            _errorMessage = 'Please enter Resume Date';
          }
          break;
        default:
          break;
      }
    });
  }

  final fromdatecontroler = TextEditingController();
  final todatecontroler = TextEditingController();
  final leaveapplyforcontroler = TextEditingController();
  final resumedatecontroler = TextEditingController();

  final LeaveController leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomText('Leave Duration :',18,Color(0xFF13322A)),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomTextFeilds('DD/MM/YYYY', fromdatecontroler, (value){
                      if(!_isValid &&
                          currentStepIndex == 0 && fromdatecontroler.text.isEmpty){
                        return 'Please enter From Date';
                      }
                      return null;
                    }, Icons.calendar_month, (){
                      var datepicked = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2030),).then((datepicked){
                        if(datepicked != null){
                          final formattedDate = "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                          fromdatecontroler.text = formattedDate;
                        }
                      });
                    },null,TextCapitalization.words),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomTextFeilds('DD/MM/YYYY', todatecontroler, (value){
                      if(!_isValid &&
                          currentStepIndex == 0 && todatecontroler.text.isEmpty){
                        return 'Please enter To Date';
                      }
                      return null;
                    }, Icons.calendar_month, (){
                      var datepicked = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate:  DateTime(2030),).then((datepicked){
                        if(datepicked != null){
                          final formattedDate = "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                          todatecontroler.text = formattedDate;
                        }
                      });
                    },null,TextCapitalization.words),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),

            CustomText('Leave Apply For :',18,Color(0xFF13322A)),

            SizedBox(height: 8),

            CustomTextFeilds('Purpose', leaveapplyforcontroler, (value){
              if(!_isValid &&
                  currentStepIndex == 0 && leaveapplyforcontroler.text.isEmpty){
                return 'Please enter Purpose of leave';
              }
              return null;
            }, null, null,null,TextCapitalization.words),

            SizedBox(height: 20,),

            CustomText('Resume On :',18,Color(0xFF13322A)),

            SizedBox(height: 8),

            CustomTextFeilds('DD/MM/YYYY', resumedatecontroler, (value){
              if(!_isValid &&
                  currentStepIndex == 0 && resumedatecontroler.text.isEmpty){
                return 'Please enter Purpose of leave';
              }
              return null;
            }, Icons.calendar_month, (){
              var datepicked = showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate:  DateTime(2030),).then((datepicked){
                if(datepicked != null){
                  final formattedDate = "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                  resumedatecontroler.text = formattedDate;
                }
              });
            },null,TextCapitalization.words),

            SizedBox(height: 60,),

            Align(
              alignment: Alignment.center,
              child: Card(
                shadowColor:Color(0xff13322A) ,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Set rounded corners for the card
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff13322A),
                    ),
                    onPressed: () {
                      _validateFields() ;
                      if(_isValid){
                        String FromDate = fromdatecontroler.text;
                        String ToDate = todatecontroler.text;
                        String LeaveFor = leaveapplyforcontroler.text;
                        String ResumeDate = resumedatecontroler.text;
                        Leavemodel leaveModel = Leavemodel(
                            fromDate: FromDate,
                            toDate: ToDate,
                            purpose: LeaveFor,
                            resumeDate: ResumeDate);
                        leaveController.addLeave(leaveModel);

                        fromdatecontroler.clear();
                        todatecontroler.clear();
                        leaveapplyforcontroler.clear();
                        resumedatecontroler.clear();
                      }
                    },
                    child: Text(
                      'Take Leave',
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