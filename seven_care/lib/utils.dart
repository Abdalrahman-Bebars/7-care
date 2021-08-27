
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Pushpage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
void Launch_url(String url)async{
  if (await canLaunch(url)) {
    await launch(url);
  }
    else{
      throw throw 'Could not launch $url';
        }
  }


