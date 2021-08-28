import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_care/Screens/search_result.dart';

import '../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final searching = TextEditingController();

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
                  style: Theme.of(context).textTheme.headline5!.copyWith(
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kTextColor.withOpacity(.23),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchMenu()),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: IgnorePointer(
                            child: TextField(
                              controller: searching,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.search),
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: kTextColor.withOpacity(.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
