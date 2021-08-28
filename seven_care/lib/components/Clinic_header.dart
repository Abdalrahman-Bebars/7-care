import 'package:flutter/material.dart';

import '../constants.dart';

class Clinic_header extends StatelessWidget {
  const Clinic_header({
    Key key,
    this.size,
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
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Mohamed's clinic",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Heart surgeon",
              style: TextStyle(fontSize: 20, color: Colors.white)
            ),
            Text(
                "Address: Mansoura",
                style: TextStyle(fontSize: 20, color: Colors.white)
            ),
            Text(
              "Fees: 200 LE ",
                style: TextStyle(fontSize: 20, color: Colors.white)
            ),
            Text(
                "Rating: 4.5",
                style: TextStyle(fontSize: 20, color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}
