import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/material.dart';

import 'id_screen.dart';

class EmergencyTab extends StatelessWidget {
  static const String routeName ='Emergency_Tab';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ignore: deprecated_member_use
                SizedBox(),
                Image.asset('assets/images/x1.0/hospital.jpg'),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  child: RaisedButton(

                    color: MyThemeData.primaryColor,

                    onPressed: () {
                      Navigator.pushNamed(context, IdScreen.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Text('Get started',
                        style : TextStyle(
                            color: Colors.white,
                            fontSize: 18)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}