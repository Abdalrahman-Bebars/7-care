//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/DoctorFirebaseServices.dart';
import 'package:seven_care/components/MyCard.dart';
import 'package:seven_care/components/TestDataWidget.dart';
import 'package:seven_care/constants.dart';

class DoctorsScreen extends StatefulWidget {
  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {

  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        backgroundColor: kPrimaryColor,
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document){
              return MyCard(
                content: (document["name"]),
                h: 50,
                w: 200,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
