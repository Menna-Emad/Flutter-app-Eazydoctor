import 'dart:async';

import 'package:eazyydoctor/auth/signIn.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Startscreen extends StatefulWidget{
  static const String routeName = 'Startscreen';
  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
          () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyThemeData.primaryColor,
      child: Center(
        child: Container(
          child: Center(
            child: Image.asset(
              "assets/images/x1.0/animation.png",
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
