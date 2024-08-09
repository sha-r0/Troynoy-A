import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/src/features/expenses/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(ExpenseModel expense) async {
    try {
      await _firestore.collection('Expense').add(expense.toMap());
      Get.snackbar('Success', 'Expense added successfully',colorText: Colors.white);
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Stream<List<ExpenseModel>> getUsers() {
    return _firestore.collection('Expense').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ExpenseModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}



















// @override
// void initState() {
//   super.initState();
//   getData();
// }

// Future<void> uploadData(ExpenseModel expensemodel) async {
//   QuerySnapshot snap = await FirebaseFirestore.instance
//       .collection('Employee Details').where('EmployeeId',isEqualTo: usermodel?.EmployeeId)
//       .get();
//   print(snap.docs[0].id);
//
//   try {
//     final _Firestore = FirebaseFirestore.instance;
//     await _Firestore.collection('Employee Details')
//         .doc(snap.docs[0].id)
//         .collection('Expense')
//         .doc(DateFormat('dd MMMM yyyy hh:mm a').format(DateTime.now()))
//         .set(expensemodel.ExpenseData());
//     // Optionally fetch data again after uploading
//     getData();
//   } catch (e) {
//     print(e.toString());
//   }
// }

// void getData()async{
//   try{
//     QuerySnapshot snap = await FirebaseFirestore.instance
//         .collection('Employee Details').where('EmployeeId',isEqualTo: usermodel?.EmployeeId)
//         .get();
//     print(snap.docs[0].id);
//     print(snap.docs[0].id);
//
//     DocumentSnapshot snap2 = await FirebaseFirestore.instance
//         .collection('Employee Details')
//         .doc(snap.docs[0].id)
//         .collection('Expense')
//         .doc(DateFormat('dd MMMM yyyy hh:mm a').format(DateTime.now()))
//         .get();
//     print('what is is ${snap2.data()}');
//   }catch(e){
//     print('Error is ${e}');
//   }
// }