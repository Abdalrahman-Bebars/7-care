import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/constants.dart';

import 'MyCard.dart';
import 'TestDataWidget.dart';
import 'TitleWithMoreButton.dart';
import 'header_with_search_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithButton(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 110,
              child: TestData(),
            ),
          ),
        ],
      ),
    );
  }
}
