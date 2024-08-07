// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../features/expenses/model/expense_model.dart';
//
// class FirebaseService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   Future<List<ExpenseModel>> getExpenses() async {
//     try {
//       QuerySnapshot snapshot = await _db.collection('expenses').get();
//       return snapshot.docs.map((doc) => ExpenseModel.fromFirestore(doc)).toList();
//     } catch (e) {
//       throw Exception('Failed to load expenses: $e');
//     }
//   }
//
//   Future<void> addExpense(ExpenseModel expense) async {
//     try {
//       await _db.collection('expenses').add(expense.toMap());
//     } catch (e) {
//       throw Exception('Failed to add expense: $e');
//     }
//   }
// }
