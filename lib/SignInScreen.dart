import 'package:eazyydoctor/ReusableTextField.dart';
import 'package:eazyydoctor/SignUpScreen.dart';
import 'package:eazyydoctor/SplashScreen.dart';
import 'package:eazyydoctor/homeScreen.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordTextController = TextEditingController();

  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/x1.0/login.jpg'),
                  fit: BoxFit.fill)),
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.4, 20, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    reusableTextField(
                        'Enter UserName',
                        Icons.person_outline_outlined,
                        false,
                        emailTextController),
                    SizedBox(
                      height: 30,
                    ),
                    reusableTextField(
                        'Enter Password',
                        Icons.lock_open_outlined,
                        false,
                        passwordTextController),
                    SizedBox(
                      height: 20,
                    ),
                    signInSignUpButton(context, true, () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailTextController.text,
                              password: passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>SPscreen()));
                      }).onError((error, stackTrace) {
                        print("error ${error.toString()}");
                      });
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                minimumSize: Size(10, 10)),
                            onPressed: signIn,
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            label: Text('signIn Google')),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                minimumSize: Size(10, 10)),
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                            label: Text('signIn facebook')),
                      ],
                    ),
                    signUpOption(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have Account ? ",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Future signIn() async {
    await GoogleSignInApi.login();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>SPscreen()));
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
