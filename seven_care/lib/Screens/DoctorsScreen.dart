//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/DoctorFirebaseServices.dart';
import 'package:seven_care/components/Clinic_data.dart';
import 'package:seven_care/components/MyCard.dart';
import 'package:seven_care/components/TestDataWidget.dart';
import 'package:seven_care/constants.dart';
import 'package:seven_care/utils.dart';

import 'Clinic.dart';

class DoctorsScreen extends StatefulWidget {
  String name;
  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return InkWell(
                child: MyCard(
                  content: ("Dr. "+document["name"]),
                  h: 50,
                  w: 200,
                ),
                onTap: () {
                  Pushpage(
                      context,
                      Clinic(
                          name: document["name"].toString(),
                          lat: document["lat"],
                          lng: document["lng"]));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
