import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eazyydoctor/constants.dart';
import 'package:provider/provider.dart';
import 'package:eazyydoctor/api/doctor_api.dart';
import 'package:eazyydoctor/notifier/doctors_notifier.dart';
import 'package:eazyydoctor/screens/specialist_screen.dart';
import 'package:eazyydoctor/homeScreen.dart';

import '../model/doctors.dart';

class ActiveReservation extends StatefulWidget {
  @override
  _ActiveReservationState createState() => _ActiveReservationState();
}

class _ActiveReservationState extends State<ActiveReservation> {
  @override
  void initState() {
    DoctorsNotifier doctorsNotifier =
        Provider.of<DoctorsNotifier>(context, listen: false);

    getDoctors(doctorsNotifier);
    super.initState();
  }

  Widget build(BuildContext context) {
    DoctorsNotifier doctorsNotifier = Provider.of<DoctorsNotifier>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        // centerTitle: false,
        title: Text(
          'الحجوزات',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: kDefaultPadding / 2,
            // ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: kMyColor,
                    ),
                  ),
                  ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return (doctorsNotifier!.currentDoctors?.img == null)
                            ? Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/images/x1.0/nobookings.png",
                                    ),
                                  ),
                                ],
                              )
                            : InkWell(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 15,
                                        ),
                                        height: 280,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: <Widget>[
                                            Container(
                                              height: 280,
                                              width: 360,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 12),
                                                    blurRadius: 20,
                                                    color: Colors.black12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  color: Colors.grey[200],
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              kDefaultPadding /
                                                                  2,
                                                        ),
                                                        height: 100,
                                                        width: 120,
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                            doctorsNotifier
                                                                .currentDoctors!
                                                                .img!,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        child: SizedBox(
                                                          // height: size.width - 290,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                doctorsNotifier
                                                                    .currentDoctors!
                                                                    .name!,
                                                                style:
                                                                    GoogleFonts
                                                                        .almarai(
                                                                  textStyle:
                                                                      textCard,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Text(
                                                                doctorsNotifier
                                                                    .currentDoctors!
                                                                    .cat!,
                                                                style:
                                                                    GoogleFonts
                                                                        .almarai(
                                                                  textStyle:
                                                                      textCard,
                                                                  color:
                                                                      kTextLightColor,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 9,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      height: 25,
                                                      width: 25,
                                                      child: Image.network(
                                                        doctorsNotifier
                                                            .currentDoctors!
                                                            .imgIcon!,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'جلدية متخصص في تجميل وليزر الأطفال',
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kTextLightColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      height: 22,
                                                      width: 22,
                                                      child: Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: Colors.blue[700],
                                                        size: 23,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      doctorsNotifier!
                                                          .currentDoctors!
                                                          .location!,
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kTextLightColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      height: 22,
                                                      width: 22,
                                                      child: Icon(
                                                        Icons
                                                            .price_change_outlined,
                                                        color: Colors.blue[700],
                                                        size: 23,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'سعر الكشف:',
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kTextLightColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      doctorsNotifier
                                                          .currentDoctors!
                                                          .price!,
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kTextLightColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      height: 22,
                                                      width: 22,
                                                      child: Icon(
                                                        Icons
                                                            .watch_later_outlined,
                                                        color: Colors.blue[700],
                                                        size: 23,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'مدة الانتظار:',
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kPrimaryColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      doctorsNotifier
                                                          .currentDoctors!
                                                          .waiting!,
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: textCard,
                                                        color: kPrimaryColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 13,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 35,
                                                      width: 240,
                                                      color: Colors.grey[200],
                                                      child: Center(
                                                        child: Text(
                                                          'متاح اليوم 04:00م',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kTextLightColor,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 35,
                                                      width: 90,
                                                      child: Center(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            doctorsNotifier
                                                                    .currentDoctors =
                                                                null;
                                                          },
                                                          child: Text(
                                                            'الغاء الحجز',
                                                            style: GoogleFonts
                                                                .almarai(
                                                              textStyle:
                                                                  textCard,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .redAccent[700],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
