import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazyydoctor/auth/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../themeData.dart';

class Profile extends StatefulWidget {
  static const routeName = 'profile';

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  // ignore: non_constant_identifier_names
  CollectionReference dataref = FirebaseFirestore.instance.collection("Data");
  var fullName , Allergy, PreviousSurgeries ,BloodType,ImmuneDisease,OtherDiseases ;
  
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  Profile() async{
var formdata = formstate.currentState;

if (formdata!.validate()){
showLoading(context);
 formdata.save();
 await dataref.add({
   "name":fullName,
   "blood type":BloodType,
   "ImmuneDisease":ImmuneDisease,
   "OtherDiseases":OtherDiseases,
   "PreviousSurgeries":PreviousSurgeries,
   "Allergy":Allergy,
   "userid":FirebaseAuth.instance.currentUser!.uid,

 });
 Navigator.of(context).pushNamed("home");
}
  }
  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: MyThemeData.primaryColor,
            title: Text(
              'profile patient',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    decoration: InputDecoration(labelText: 'Full Name :'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(

                    controller:
                        dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Birthday Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              1900), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
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
                    decoration: InputDecoration(labelText: 'Your blood type:'),
                  ),
                    SizedBox(
                    height: 15,
                  ),
                    TextFormField(
                    onSaved: (val) {
                      ImmuneDisease = val;
                    },
                    decoration:
                        InputDecoration(labelText: 'Your Immune Disease :'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      OtherDiseases = val;
                    },
                    decoration: InputDecoration(labelText: 'Other Diseases :'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      PreviousSurgeries = val;
                    },
                    decoration:
                        InputDecoration(labelText: 'Your Previous Surgeries :'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      Allergy = val;
                    },
                    decoration: InputDecoration(labelText: 'Your Allergy :'),
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
                      onPressed: () async{
                        await Profile();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('Save Data',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),],))
          ),
        ),
      ],
    );
  }
}
