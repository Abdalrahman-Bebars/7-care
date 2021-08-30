import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      color: HexColor("#FF4848"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: widget.h,
        width: widget.w,
        child: Stack(
          children: [
            Padding(
                child: Center(child: Text(widget.content),),padding: EdgeInsets.all(8.0),),
          ],


        ),

      ),
    );
  }
}