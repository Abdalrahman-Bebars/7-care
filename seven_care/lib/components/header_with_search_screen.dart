import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/components/searchdropmenu.dart';
import '../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * .2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * .2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Card(
                    child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/care.jpg"),
                )),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text('Please select a speciality:', style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white),),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: 0),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      color: kTextColor.withOpacity(.23),
                    )
                  ],
                ),
                child: SearchDropDownButton(),
              ))
        ],
      ),
    );
  }
}

// TextField(
// decoration: InputDecoration(
// suffixIcon: Icon(Icons.search,color: Colors.red,),
// hintText: "Search",
// hintStyle: TextStyle(
// color: kTextColor.withOpacity(.5),
// ),
// enabledBorder: InputBorder.none,
// focusedBorder: InputBorder.none,
// ),
// )
