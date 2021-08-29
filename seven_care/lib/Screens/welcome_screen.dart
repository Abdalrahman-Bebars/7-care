import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:seven_care/Screens/login_screen.dart';
import 'package:seven_care/Screens/register_screen.dart';
import 'package:seven_care/components/customButton.dart';

import '../utils.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation myAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      // print(controller.value);
      setState(() {});
    });

    myAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('assets/care.jpg'),
                    height: myAnimation.value * 200,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              CustomButton(
                onPress: () {
                  Pushpage(context, LoginScreen());
                },
                title: 'Sign In',
              ),
              CustomButton(
                onPress: () {
                  Pushpage(context, RegisterScreen());
                },
                title: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
