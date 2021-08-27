import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('Doctors');

  Future<void> createUserData(String name,
      String spec,
      String address,
      String lat,
      String lng,
      int fees,
      double rating,
      String work_time,
      String uid) async {
    return await profileList
        .doc(uid)
        .set({'name': name,
      'spec': spec,
      "address": address,
      "lat": lat,
      "lng": lng,
      "fees": fees,
      "rating": rating,
      "working_time": work_time});
  }
  Future getDoctorsList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}