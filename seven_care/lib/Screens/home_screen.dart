import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/Screens/welcome_screen.dart';
import 'package:seven_care/components/body.dart';
import 'package:seven_care/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  UserCredential user;

  HomeScreen({this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('newEmail');
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                Pushpage(context, WelcomeScreen());
                setState(() {});
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Launch_url("https://egcovac.mohp.gov.eg/#/registration");
        },
        label: Text("Covid Vaccine"),
        icon: Icon(Icons.medical_services),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
