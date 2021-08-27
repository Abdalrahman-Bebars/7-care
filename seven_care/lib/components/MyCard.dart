import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  String content;
  double h ;
  double w ;
  MyCard({this.content = "-",this.h=100,this.w=100});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: widget.h,
        width: widget.w,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text(widget.content),),
        ),
      ),
    );
  }
}