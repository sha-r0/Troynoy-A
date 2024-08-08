import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first/src/common_widget/custom_text.dart';
import 'package:first/src/common_widget/custom_text_feild.dart';

import '../../../controller/work_controller.dart';

class Workadd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WorkController workController = Get.put(WorkController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText('Work :', 18, Color(0xFF13322A)),
              SizedBox(height: 8),
              CustomTextFeilds(
                'Work Title',
                workController.workController,
                    (value) {
                  if (!workController.isValid.value && workController.currentStepIndex.value == 0 && workController.workController.text.isEmpty) {
                    return 'Please enter Work';
                  }
                  return null;
                },
                null,
                null,
                null,
                TextCapitalization.words,
              ),
              SizedBox(height: 20),
              CustomText('Date :', 18, Color(0xFF13322A)),
              SizedBox(height: 8),
              CustomTextFeilds(
                'DD/MM/YYYY',
                workController.dateController,
                    (value) {
                  if (!workController.isValid.value && workController.currentStepIndex.value == 0 && workController.dateController.text.isEmpty) {
                    return 'Please enter Date';
                  }
                  return null;
                },
                Icons.calendar_month,
                    () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(3000),
                  ).then((datepicked) {
                    if (datepicked != null) {
                      final formattedDate = "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                      workController.dateController.text = formattedDate;
                    }
                  });
                },
                null,
                TextCapitalization.words,
              ),
              SizedBox(height: 20),
              CustomText('Company Name :', 18, Color(0xFF13322A)),
              SizedBox(height: 8),
              CustomTextFeilds(
                'Name of company ',
                workController.companyNameController,
                    (value) {
                  if (!workController.isValid.value && workController.currentStepIndex.value == 0 && workController.companyNameController.text.isEmpty) {
                    return 'Please enter Name of company';
                  }
                  return null;
                },
                null,
                null,
                null,
                TextCapitalization.words,
              ),
              SizedBox(height: 20),
              CustomText('Work Description :', 18, Color(0xFF13322A)),
              SizedBox(height: 8),
              CustomTextFeilds(
                'What you do ',
                workController.workDescriptionController,
                    (value) {
                  if (!workController.isValid.value && workController.currentStepIndex.value == 0 && workController.workDescriptionController.text.isEmpty) {
                    return 'Please enter Work description';
                  }
                  return null;
                },
                null,
                null,
                TextInputType.text,
                TextCapitalization.words,
              ),
              SizedBox(height: 20),
              CustomText('File Upload :', 18, Color(0xFF13322A)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: workController.fileController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Attach file',
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      workController.pickFile();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.file_upload, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: Card(
                  shadowColor: Color(0xff13322A),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff13322A),
                    ),
                    onPressed: () {
                      workController.uploadWork();
                    },
                    child: Text(
                      'Upload Work',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
