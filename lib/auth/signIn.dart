
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eazyydoctor/auth/signUp.dart';
import 'package:eazyydoctor/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../SplashScreen.dart';
import 'alert.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login';
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata!.save();
      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email"))
            ..show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user"))
            ..show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/x1.0/logo.png"),heightFactor: 0.5,),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        mypassword = val;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Password can't to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "Password can't to be less than 4 letter";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("if you havan't accout "),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>SignUp()));
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                    Container(
                        child: RaisedButton(
                          textColor: Colors.white,
                          onPressed: () async {
                            var user = await signIn();
                            if (user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>SPscreen()));
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}