import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eazyydoctor/themeData.dart';

import 'file.dart';
//import 'file.dart';
class NatScreen extends StatefulWidget {
  static const routeName = 'NatScreen';

  @override
  _NatScreenState createState() => _NatScreenState();

}
class _NatScreenState extends State<NatScreen>{
 // static const String routeName = 'Nat_screen';
final Stream< QuerySnapshot > users =FirebaseFirestore;

  var id;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  NatScreen() async{
    var formdata = formstate.currentState;

    if (formdata!.validate()){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Directionality( textDirection: TextDirection.ltr,
      child: Scaffold(
        body:Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
         child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              (
                 Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        //color: Colors.teal,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),

                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Emergency',
                            style: TextStyle(
                              color: MyThemeData.primaryColor,
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
              Form(

                key: formstate,
                child: TextFormField(  validator: (val) {
                  if (val!.length > 14) {
                    return "enter the national ID";
                  }
                  if (val.length < 14) {
                    return "enter the national ID";
                  }
                  return null;
                },
                onSaved: (val) {
                  id = val;
                  },
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
                  color: MyThemeData.primaryColor,
                  onPressed: () async {
                    await NatScreen();
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
      ),),
    );
  }
}
