import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

var kPrimaryColor = HexColor("#FA1616");
//var kPrimaryColor = HexColor("#ff053F5E");
var kTextColor = HexColor("#000000");
var kBackgroundColor = HexColor("#E4F9FF");
double kFontsize = 20.0;
double kDefaultPadding = 20.0;

const kTextFieldDecoration = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(fontSize: 20, color: Colors.redAccent),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);
