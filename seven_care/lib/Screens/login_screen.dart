import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/Screens/home_screen.dart';
import 'package:seven_care/components/customButton.dart';
import 'package:seven_care/components/customRow.dart';
import 'package:seven_care/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential userCredential;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool showPassword = true;

  login() async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRow(title: 'Let\'s Start With Sign In !'),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: emailController,
                validator: (String value) =>
                    value.isEmpty ? 'Email can\'t be blank' : null,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: passwordController,
                validator: (String value) =>
                    value.isEmpty ? 'You Should Enter Your Password' : null,
                obscureText: showPassword,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.redAccent,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                title: 'Sign In',
                onPress: () async {
                  if (formKey.currentState.validate()) {
                    login();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('newEmail', emailController.text);
                    Pushpage(context, HomeScreen(user: userCredential));
                  }
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
