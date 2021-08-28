import 'package:flutter/material.dart';
import 'package:seven_care/components/Clinic_Body.dart';
import 'package:seven_care/components/Clinic_header.dart';
import 'package:seven_care/map_page.dart';
import 'package:seven_care/utils.dart';

import '../constants.dart';

class Clinic extends StatefulWidget {
  @override
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Clinic_Body(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //Pushpage(context, MyAppointments());
            },
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.date_range_outlined,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              //Pushpage(context, Mychat());
            },
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.chat_bubble,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Pushpage(context, Mymap());
            },
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.navigation_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
