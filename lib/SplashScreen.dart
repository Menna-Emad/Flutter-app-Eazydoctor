import 'dart:async';
import 'dart:math';

import 'package:eazyydoctor/News/NewsTap.dart';

import 'package:eazyydoctor/homeScreen.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:eazyydoctor/tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmanager/workmanager.dart';


FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future showNotification() async {
  int rndmIndex = Random().nextInt(Tips().tibs.length - 1);

  AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    '$rndmIndex.0',
    'EazyDoctor',
    channelDescription: 'صحتك بالدنيا',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
    threadIdentifier: 'thread_id',
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin?.show(
    rndmIndex,
    'بنفكرك...',
    Tips().tibs[rndmIndex],
    platformChannelSpecifics,
  );
}

void callbackDispatcher() {
  // initial notifications
  var initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings();

  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  WidgetsFlutterBinding.ensureInitialized();

  flutterLocalNotificationsPlugin?.initialize(
    initializationSettings,
  );

  Workmanager().executeTask((task, inputData) {
    showNotification();
    return Future.value(true);
  });
}

class SPscreen extends StatefulWidget {
  @override
  _SPState createState() => _SPState();
}

class _SPState extends State<SPscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),() {
      Timer(
        Duration(milliseconds: 2200),
            () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>HomeScreen())
          );
        },
      );
    });

    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("assets/images/x1.0/backimage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:

        Column(crossAxisAlignment: CrossAxisAlignment.center,

          children: [SizedBox(height: 20,),
            Center(child: Image.asset("assets/images/x1.0/logo.png",),),SizedBox(height: 50,),
            Align(child: Text('صحتك بالدنيا',style: GoogleFonts.alef(color: MyThemeData.primaryColor,fontSize: 30),),alignment: Alignment.bottomCenter,)
          ],
        ),

      ),
    );
  }
}