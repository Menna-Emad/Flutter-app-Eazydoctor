import 'package:flutter/material.dart';

import 'national.dart';

class IdScreen extends StatelessWidget {
  static const String routeName = 'id_screen';
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
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
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
                            'assets/images/x1.0/heart.jpg',
                            height: 280,
                            width: 160,
                          ),
                          SizedBox(
                            height: 20,
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
                  decoration: InputDecoration(labelText: 'Enter an Identity Id'),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 60,
                width: 200,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.pushNamed(context, NatScreen.routeName);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text('Next',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
