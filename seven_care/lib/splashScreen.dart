import 'package:flutter/material.dart';
import 'package:seven_care/Screens/home_screen.dart';
import 'package:seven_care/Screens/welcome_screen.dart';
import 'package:seven_care/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String finalEmail;

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      await Future.delayed(
          Duration(milliseconds: 1500),
          () => Pushpage(
              context, finalEmail == null ? WelcomeScreen() : HomeScreen()));
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedEmail = prefs.getString('newEmail');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/care.jpg'),
          backgroundColor: kBackgroundColor,
          radius: 100.0,
        ),
      ),
    );
  }
}
