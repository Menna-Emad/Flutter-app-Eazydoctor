import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileScreen extends StatefulWidget {
  static const routeName = 'FileScreen';

  @override
  _FileScreenState createState() => _FileScreenState();

}
class _FileScreenState extends  State<FileScreen>{
  CollectionReference emergencyref = FirebaseFirestore.instance.collection("emergency");

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
          children: <Widget> [
            Center(
                child: Column(
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

                     ],

                ),
              ),
              FutureBuilder(
             future:FirebaseFirestore.instance.collection("emergency").doc("12345678901234").get(),
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                      return Text(snapshot.data.toString());


                   }
                   else
                     {
                        return Container();
                     }
                 },

    ) ,


        ],

        )
    );
}
}