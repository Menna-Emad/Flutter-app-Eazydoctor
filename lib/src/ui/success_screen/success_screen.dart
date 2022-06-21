import 'dart:async';
import 'package:eazyydoctor/src/ui/homepage/homepage.dart';
import 'package:flutter/material.dart';
class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
          () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) =>HomePage()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Center(
            child: Image.asset(
              "assets/images/x1.0/done.png",
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}