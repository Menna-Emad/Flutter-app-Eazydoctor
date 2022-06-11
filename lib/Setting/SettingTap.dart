import 'package:eazyydoctor/Setting/Profile.dart';
import 'package:eazyydoctor/SignInScreen.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eazyydoctor/screens/active_reservation.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Container(
            // color:MyThemeData.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: MyThemeData.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: MyThemeData.primaryColor,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Profile.routeName);
                        },
                        child: Container(
                          child: Text(
                            'My Profile',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: MyThemeData.primaryColor,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActiveReservation()));
                        },
                        child: Container(
                          child: Text(
                            'Active Booking',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    color: MyThemeData.primaryColor,
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.black,
                        ),
                        builAccountOption(context, 'language'),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: MyThemeData.primaryColor,
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'FAQ',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.mark_chat_read_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: MyThemeData.primaryColor,
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                'About US',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.face,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("signed out");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      });
                    },
                    child: Container(
                        child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: MyThemeData.primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector builAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('English'),
                    ),
                    TextButton(onPressed: () {}, child: Text('Arabic')),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('close'))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
