import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  Function onPress;

  MyButton({this.title = '', required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
        child: MaterialButton(
          onPressed: onPress(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
