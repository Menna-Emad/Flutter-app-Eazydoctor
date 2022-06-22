
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
class dataScreen extends StatefulWidget {
  static const String routeName ='dataScreen';

  @override
  State<dataScreen> createState() => _dataScreenState();
}

class _dataScreenState extends State<dataScreen> {
  CollectionReference dataref = FirebaseFirestore.instance.collection("Data");

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget > [
          SizedBox(height: 80,),
          Text('Profile Patient',style: TextStyle(
            color: Colors.teal,
            fontSize: 30,
            fontWeight:FontWeight.w600,
            letterSpacing: 1,
          ),
          ),
          Image.asset('assets/images/x1.0/profile.png',height: 200,width: 180,),
          Expanded(
            child: FutureBuilder(
              future:dataref.where("userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .get() ,
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (ctx,i){
                        return
                          Card(
                            child:  Padding(
                              padding: const EdgeInsets.all(16.0),
                              child:   Center(
                                child: Text(
                                  "Name : ${snapshot.data.docs[i]['name']}\n blood type : ${snapshot.data.docs[i]['blood type']}\n ImmuneDisease : ${snapshot.data.docs[i]['ImmuneDisease']}\n OtherDiseases : ${snapshot.data.docs[i]['OtherDiseases']}\n PreviousSurgeries : ${snapshot.data.docs[i]['PreviousSurgeries']}\n Allergy : ${snapshot.data.docs[i]['Allergy']}",
                                  style: TextStyle(fontSize: 14,                                      height: 1.2
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                      }
                  );
                }
                else
                {
                  return Container();
                }
              },

            ),
          ) ,
        ],

      ),
    );
  }
}
