import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('Doctors')
        .where('spec', isEqualTo: queryString)
        .get();
  }
}

// class SearchService {
//   searchByName(String searchField) {
//     return FirebaseFirestore.instance
//         .collection('Doctors')
//         .where('searchkey',
//             isEqualTo: searchField.substring(0, 1).toUpperCase())
//         .get();
//   }
// }

// Future getData(String collection) async {
//   QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection(collection).get();
//   return snapshot.docs;
// }
//
// Future queryData(String querystring) async {
//   return FirebaseFirestore.instance
//       .collection('Doctors')
//       .where('spec', isLessThanOrEqualTo: querystring)
//       .get();
// }
