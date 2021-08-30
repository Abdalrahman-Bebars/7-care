import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/customButton.dart';
import 'package:seven_care/components/customRow.dart';
import 'package:seven_care/components/genderButton.dart';
import 'package:seven_care/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
import '../utils.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool confirmPassword = true;
  bool isChecked = false;
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential myUser;

  register() async {
    try {
      myUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myEmailController.text, password: myPasswordController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('newEmail', myEmailController.text);
      Pushpage(context, HomeScreen(user: myUser));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomRow(title: 'Let\'s Create Account !'),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.0,
                ),
                GenderDropDownButton(),
                SizedBox(
                  height: 19.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Phone',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.0,
                ),
                TextFormField(
                  controller: myEmailController,
                  validator: (value) => EmailValidator.validate(value)
                      ? null
                      : "Please enter a valid email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.0,
                ),
                TextFormField(
                  controller: myPasswordController,
                  validator: (String value) {
                    if (value.isEmpty) return 'You Should Enter Your Password';
                    // password validation is disabled to make testing easier
                    /*if (RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return null;
                    }
                    return 'Use Special\, UpperCase\, Chars and Numeric Value';*/
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPassword,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.red,
                          ))),
                ),
                SizedBox(
                  height: 19.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: confirmPassword,
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'You should confirm your password';
                    if (value != myPasswordController.text)
                      return 'not matches';
                    return null;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmPassword = !confirmPassword;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.red,
                          ))),
                ),
                CheckboxListTile(
                  title: Text(
                    'accept our privacy Policy, Data and Cookie Policy.',
                    style:
                        TextStyle(color: isChecked ? Colors.red : Colors.black),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isChecked,
                  onChanged: (bool val) {
                    setState(() {
                      isChecked = val;
                    });
                  },
                ),
                CustomButton(
                  title: 'Sign Up',
                  onPress: () async {
                    if (_formKey.currentState.validate()) {
                      register();
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
