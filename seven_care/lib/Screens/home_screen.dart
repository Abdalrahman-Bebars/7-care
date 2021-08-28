import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/body.dart';
import 'package:seven_care/utils.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Body(),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: (){
            Launch_url("https://egcovac.mohp.gov.eg/#/registration");
        },
        label: Text("Covid Vaccine"),
        icon: Icon(Icons.medical_services),
        backgroundColor: kPrimaryColor,


      ),

    );
  }
}
