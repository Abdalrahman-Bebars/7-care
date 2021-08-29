import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/MyCard.dart';
import 'package:seven_care/screens/Clinic.dart';
import 'package:seven_care/utils.dart';

class TestData extends StatelessWidget {
 double height ;
 double width ;
 TestData({this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Doctors").orderBy('rating').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.docs.map((document){
              return GestureDetector(
                onTap: (){
                  Pushpage(context, Clinic(name : document["name"].toString(),));
                },
                child: MyCard(
                    content: (document["name"]+"\n"+document["spec"]),
                  h: height,
                  w: width,
                  ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
