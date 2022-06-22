import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazyydoctor/auth/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import '../themeData.dart';

class Profile extends StatefulWidget {
  static const routeName = 'profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: non_constant_identifier_names
  CollectionReference dataref = FirebaseFirestore.instance.collection("Data");
  var fullName,
      birthday,
      Allergy,
      PreviousSurgeries,
      BloodType,
      ImmuneDisease,
      OtherDiseases;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  Profile() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      showLoading(context);
      formdata.save();
      await dataref.add({
        "name": fullName,
        "birthday": birthday,
        "blood type": BloodType,
        "ImmuneDisease": ImmuneDisease,
        "OtherDiseases": OtherDiseases,
        "PreviousSurgeries": PreviousSurgeries,
        "Allergy": Allergy,
        "userid": FirebaseAuth.instance.currentUser!.uid,
      });
      Navigator.of(context).pushNamed("home");
    }
  }

  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: MyThemeData.primaryColor.withOpacity(0.5),
              title: Text(
                'profile patient',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/x1.0/profile.png',
                          height: 200,
                          width: 180,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Form(
                          key: formstate,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) {
                                  if (val!.length > 50) {
                                    return "name can't to be larger than 50 letter";
                                  }
                                  if (val.length < 4) {
                                    return "name can't to be less than 4 letter";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  fullName = val;
                                },
                                decoration:
                                InputDecoration(labelText: 'Full Name :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.length > 15) {
                                    return "  please Enter your birthday date";
                                  }
                                  if (val.length < 3) {
                                    return "  please Enter your birthday date";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  birthday = val;
                                },
                                decoration:
                                InputDecoration(labelText: 'Birthday Date :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.length > 3) {
                                    return "blood type can't to be larger than 3 letter";
                                  }
                                  if (val.length < 1) {
                                    return "blood type can't to be less than 1 letter";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  BloodType = val;
                                },
                                decoration:
                                InputDecoration(labelText: 'Your blood type :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onSaved: (val) {
                                  ImmuneDisease = val;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Your Immune Disease :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onSaved: (val) {
                                  OtherDiseases = val;
                                },
                                decoration:
                                InputDecoration(labelText: 'Other Diseases :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onSaved: (val) {
                                  PreviousSurgeries = val;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Your Previous Surgeries :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onSaved: (val) {
                                  Allergy = val;
                                },
                                decoration:
                                InputDecoration(labelText: 'Your Allergy :'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 55,
                                width: 200,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  color: MyThemeData.primaryColor,
                                  onPressed: () async {
                                    await Profile();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text('Save Data',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
