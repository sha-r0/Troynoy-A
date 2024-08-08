import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:first/src/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/work_model.dart';

class WorkController extends GetxController {
  final workController = TextEditingController();
  final dateController = TextEditingController();
  final companyNameController = TextEditingController();
  final workDescriptionController = TextEditingController();
  final fileController = TextEditingController();

  var currentStepIndex = 0.obs;
  var isValid = true.obs;
  var errorMessage = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void validateFields() {
    isValid.value = true;
    errorMessage.value = '';

    switch (currentStepIndex.value) {
      case 0:
        if (workController.text.isEmpty) {
          isValid.value = false;
          errorMessage.value = 'Please enter work title';
        } else if (dateController.text.isEmpty) {
          isValid.value = false;
          errorMessage.value = 'Please enter Date';
        } else if (companyNameController.text.isEmpty) {
          isValid.value = false;
          errorMessage.value = 'Please enter Name of company';
        } else if (workDescriptionController.text.isEmpty) {
          isValid.value = false;
          errorMessage.value = 'Please enter Work description';
        }
        break;
      default:
        break;
    }
  }

  var selectedFile = Rx<File?>(null);

  // Method to pick a file
  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        final pickedFile = result.files.single;
        selectedFile.value = File(pickedFile.path!);
        fileController.text = pickedFile.name;
      } else {
        selectedFile.value = null;
        fileController.text = '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick file: $e');
    }
  }


  void uploadWork() async {
    validateFields();
    if (isValid.value) {
      String workTitle = workController.text;
      String date = dateController.text;
      String companyName = companyNameController.text;
      String workDescription = workDescriptionController.text;
      String fileUrl = fileController.text;

      WorkModel workModel = WorkModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        workTitle: workTitle,
        companyName: companyName,
        date: date,
        workDescription: workDescription,
        fileUrl: fileUrl,
      );

      try {
        await _firestore.collection('Works').doc(workModel.id).set(workModel.toMap());
        Get.snackbar('Success', 'Work information added successfully',colorText: Colors.white);
        workController.clear();
        dateController.clear();
        companyNameController.clear();
        workDescriptionController.clear();
        fileController.clear();
      } catch (e) {
        Get.snackbar('Error', 'Failed to add work information: $e');
      }
    } else {
      Get.snackbar('Error', errorMessage.value);
    }
  }

  Stream<List<WorkModel>>getwork(){
    return _firestore.collection('Works').snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return WorkModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }



}
