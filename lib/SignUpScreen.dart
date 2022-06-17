import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazyydoctor/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ReusableTextField.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signUp';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordTextController = TextEditingController();

  TextEditingController emailTextController = TextEditingController();

  TextEditingController userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/x1.0/register.jpg',
                    width: 175,
                    height: 190,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField('Enter UserName',
                      Icons.person_outline_outlined, false, userTextController),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField('Enter email', Icons.email_outlined, false,
                      emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter Password', Icons.lock_open_outlined,
                      false, passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text)
                        .then((value) {
                      print('created New account');
                      FirebaseFirestore.instance.collection("users").add(
                          {
                            'username' : userTextController,
                            'email' : emailTextController
                          });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
