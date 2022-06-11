import 'package:flutter/material.dart';
class FileScreen extends StatelessWidget {
  static const String routeName ='file_screen';
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
          children: <Widget> [
            Center(
              child: Column(
                children: <Widget > [
                  SizedBox(height: 80,),
                  Text('Profile Patient',style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                    fontWeight:FontWeight.w600,
                    letterSpacing: 1,
                  ),
                  ),
                  Image.asset('assets/images/x1.0/profile.png',height: 200,width: 180,),
                ],
              ),
            )
          ],
        )
    );
  }
}