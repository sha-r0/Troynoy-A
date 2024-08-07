import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/src/features/leaves/model/leave_model.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  final firebasefirestore = FirebaseFirestore.instance;

  Future<void> addLeave(Leavemodel leaveModel) async {
    try {
      await firebasefirestore.collection('Leave').add(leaveModel.toMap());
    } catch (e) {
      print('Error${e}');
    }
  }

  Stream<List<Leavemodel>> getLeave() {
    return firebasefirestore.collection('Leave').snapshots().map((snapshot){
     return snapshot.docs.map((doc){
        return Leavemodel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
