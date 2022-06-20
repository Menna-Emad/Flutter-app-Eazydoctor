//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//class FileScreen extends StatelessWidget {
  //CollectionReference dataref = FirebaseFirestore.instance.collection("Data");
  //static const String routeName ='file_screen';
  //@override
  //Widget build(BuildContext context){
   // return Scaffold(
       // body: Stack(
         // children: <Widget> [
          //  Center(
            //  child: Column(
              //  children: <Widget > [
                 // SizedBox(height: 80,),
                  //Text('Profile Patient',style: TextStyle(
                  //  color: Colors.teal,
                //    fontSize: 30,
              //      fontWeight:FontWeight.w600,
                    //letterSpacing: 1,
                  //),
                  //),
                //  Image.asset('assets/images/x1.0/profile.png',height: 200,width: 180,),

              //  ],

            //  ),
          //  ),
        //    FutureBuilder(
             // future:dataref.where("userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
             //     .get() ,
           //   builder: (context,AsyncSnapshot snapshot){
               // if(snapshot.hasData){
                  // return Text(snapshot.data.toString());
                  //return ListView.builder(
                      //itemCount: snapshot.data?.docs.length,
                      //itemBuilder: (ctx,i){
                      //  return Text("${snapshot.data.docs[i].data()}");
                    //  }
                  //);

                //}
                //else
                //{
                //  return Container();
              //  }
            //  },

          //  ) ,


        //  ],

      //  )
    //);
  //}
//}