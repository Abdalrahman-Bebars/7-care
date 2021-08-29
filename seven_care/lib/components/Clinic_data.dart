import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clinic_data extends StatefulWidget {
  String name;
  Clinic_data({this.name});
  @override
  _Clinic_dataState createState() => _Clinic_dataState();
}

class _Clinic_dataState extends State<Clinic_data> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Doctors").where("name",isEqualTo: widget.name).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data.docs.map((document) {
            return  Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. "+document["name"].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                    document["spec"].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                Text(
                    "Address: "+document["address"].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                Text(
                    "Fees: "+document["fees"].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                Text(
                    "Rating: "+document["rating"].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
