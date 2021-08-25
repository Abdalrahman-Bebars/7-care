import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String querystring) async {
    return FirebaseFirestore.instance
        .collection('Doctors')
        .where('spec', isLessThanOrEqualTo: querystring)
        .get();
  }
}
