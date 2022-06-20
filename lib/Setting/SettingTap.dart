import 'package:eazyydoctor/Setting/Profile.dart';

import 'package:eazyydoctor/themeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eazyydoctor/screens/active_reservation.dart';

import '../auth/signIn.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        child: Container(color: Colors.white,
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
                      style: TextStyle(color: MyThemeData.drawerTextColor,
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
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, Profile.routeName);
                      },
                      child: Container(
                        child: Text(
                          'My Profile',
                          style: TextStyle(color: MyThemeData.drawerTextColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              ),
                        ),
                      )),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  alignment: Alignment.topLeft,
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
                          style: TextStyle(color: MyThemeData.drawerTextColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              ),
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: MyThemeData.drawerTextColor,
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
                  child: TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              'FAQ',
                              style: TextStyle(color: MyThemeData.drawerTextColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.mark_chat_read_outlined,
                              color: MyThemeData.drawerTextColor,
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
                  child: TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              'About US',
                              style: TextStyle(color: MyThemeData.drawerTextColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.face,
                              color: MyThemeData.drawerTextColor,
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
                              builder: (context) =>Login()));
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
                        style: TextStyle(fontSize: 20.0, color: MyThemeData.drawerTextColor,),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
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
