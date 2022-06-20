import 'dart:async';

import 'package:eazyydoctor/auth/signIn.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/material.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  static const String routeName = 'MyStatefulWidget';
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin { void initState() {
  super.initState();
  Timer(
    Duration(milliseconds: 2200),
        () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) =>Login()),
      );
    },
  );
}
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyThemeData.primaryColor,
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child:  Center(
          child: Image.asset('assets/images/x1.0/lolo.png'),
          //(size: 200.0),
        ),
      ),
    );
  }
}
