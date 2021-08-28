import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/Clinic_header.dart';

class Clinic_Body extends StatefulWidget {
  @override
  _Clinic_BodyState createState() => _Clinic_BodyState();
}

class _Clinic_BodyState extends State<Clinic_Body> {
  DateTime _dateTime = DateTime.now();
  final DateTime initialDateTime = DateTime(2021, 8, 28);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Clinic_header(
            size: size,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Day",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 70,
              child: CupertinoDatePicker(
                initialDateTime: _dateTime,
                minimumDate: initialDateTime,
                maximumYear: _dateTime.year,
                minimumYear: _dateTime.year,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) {
                  setState(() {
                    _dateTime = dateTime;
                  });
                },
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: Text(
              "Session",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 70,
            child: CupertinoPicker(
              itemExtent: 20,
              children: [
                Text("5:00 pm"),
                Text("5:30 pm"),
                Text("6:00 pm"),
                Text("6:30 pm"),
                Text("7:00 pm"),
                Text("7:30 pm"),
                Text("8:00 pm"),
                Text("8:30 pm"),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(
                        label: 'undo',
                        onPressed: () {
                        },
                      ),
                      content: const Text('Appointment saved',style: TextStyle(fontSize: 15),),
                      duration: const Duration(milliseconds: 3000),
                      width: 280.0, // Width of the SnackBar.
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, // Inner padding for SnackBar content.
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Make an appointment",
                  style: TextStyle(fontSize: 25),
                )),
          )
        ],
      ),
    );
  }
}
