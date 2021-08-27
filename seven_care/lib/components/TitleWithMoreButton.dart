import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/Screens/DoctorsScreen.dart';
import 'package:seven_care/utils.dart';

import '../constants.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TitleWithCustomUnderline(text: "Top Doctors",),
          Spacer(),
          FlatButton(
            color: kPrimaryColor,
            onPressed: (){
              Pushpage(context, DoctorsScreen());
            },
            child: Text("More",style: TextStyle(color: Colors.white),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),)
            ,)
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,  this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:24 ,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left :5),
            child: Text(text,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                  color: Colors.black),),
          ),

        ],
      ),
    );
  }
}
