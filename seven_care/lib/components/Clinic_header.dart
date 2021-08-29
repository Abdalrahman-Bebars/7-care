import 'package:flutter/material.dart';
import 'package:seven_care/components/Clinic_data.dart';

import '../constants.dart';

class Clinic_header extends StatelessWidget {
  final String name;

  const Clinic_header({
    Key key,
    this.size,
    this.name,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: 150,
      child: Container(
        padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding,
        ),
        height: size.height * .1,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: kTextColor.withOpacity(.23),
            )
          ],
        ),
        child:Clinic_data(name:name,)
      ),
    );
  }
}
