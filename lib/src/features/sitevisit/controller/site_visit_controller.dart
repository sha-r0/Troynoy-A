import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/src/features/sitevisit/model/site_visit_model.dart';
import 'package:get/get.dart';

class SiteVisitController extends GetxController{
  final firestore = FirebaseFirestore.instance;
  
  Stream<List<SiteVisitModel>> getsitevisit(){
    return firestore.collection('SiteVisit').snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return SiteVisitModel.fromFirebase(doc.data() as Map<String, dynamic>,doc.id);
      }).toList();
    });
  }

  Future<void> toggleVisitStatus(SiteVisitModel visit) async {
    await firestore.collection('SiteVisit').doc(visit.id).update({
      'mark_as_visited': !visit.isvisit,
    });
  }
}