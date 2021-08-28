import 'package:flutter/material.dart';

import '../constants.dart';

class CustomRow extends StatelessWidget {
  final String title;
  const CustomRow({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          Hero(
            tag: 'logo',
            child: CircleAvatar(
              backgroundColor: kBackgroundColor,
              backgroundImage: AssetImage('assets/care.jpg'),
              radius: 30.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
