//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/MyCard.dart';

class TestData extends StatelessWidget {
 double height ;
 double width ;
 TestData({this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.docs.map((document){
              return MyCard(
                  content: (document["name"]),
                h: height,
                w: width,
                );
            }).toList(),
          );
        },
      ),
    );
  }
}
