import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
