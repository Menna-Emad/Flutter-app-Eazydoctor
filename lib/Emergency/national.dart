import 'package:flutter/material.dart';

import 'file.dart';

class NatScreen extends StatelessWidget {
  static const String routeName = 'Nat_screen';
  @override
  Widget build(BuildContext context) {
    return Directionality( textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              (

                 Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Emergency',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.3,
                            ),
                          ),
                          Image.asset(
                            'assets/images/x1.0/idcard.png',
                            height: 180,
                            width: 180,
                          ),
                          SizedBox(
                            height: 110,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Enter The National ID'),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                width: 200,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.pushNamed(context, FileScreen.routeName);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text('View Profile',
                      style: TextStyle(color: Colors.white, fontSize: 18.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
