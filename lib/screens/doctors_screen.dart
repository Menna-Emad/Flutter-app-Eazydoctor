import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eazyydoctor/constants.dart';
import 'package:eazyydoctor/screens/doctorProfile_screen.dart';
import 'package:provider/provider.dart';
import 'package:eazyydoctor/notifier/doctors_notifier.dart';
import 'package:eazyydoctor/api/doctor_api.dart';

class DoctorsScreen extends StatefulWidget {
  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  void initState() {
    DoctorsNotifier doctorsNotifier =
        Provider.of<DoctorsNotifier>(context, listen: false);

    getDoctors(doctorsNotifier);
    super.initState();
  }

  @override
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
            Navigator.pop(context);
          },
        ),
        // centerTitle: false,
        centerTitle: true,
        title: Text(
          'اختر الطبيب',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     keyboardType: TextInputType.text,
            //     textAlign: TextAlign.right,
            //     decoration: kTextFieldDecoration.copyWith(
            //         hintText: 'ابحث بإسم الدكتور أو المستشفي'),
            //   ),
            // ),
            // SizedBox(
            //   height: kDefaultPadding / 2,
            // ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: kMyColor,
                    ),
                  ),
                  ListView.builder(
                      itemCount: doctorsNotifier.doctorsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  doctorsNotifier.currentDoctors =
                                      doctorsNotifier.doctorsList[index];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorProfileScreen(),
                                    ),
                                  );
                                },
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
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultPadding / 2,
                                                  ),
                                                  height: 100,
                                                  width: 120,
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      doctorsNotifier
                                                          .doctorsList[index]
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
                                                              .doctorsList[
                                                                  index]
                                                              .name!,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kPrimaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          doctorsNotifier
                                                              .doctorsList[
                                                                  index]
                                                              .cat!,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kTextLightColor,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .star_half_rounded,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          'التقييم العام من 1004 زائر',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kTextLightColor,
                                                            fontSize: 15,
                                                          ),
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
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 25,
                                                width: 25,
                                                child: Image.network(
                                                  doctorsNotifier
                                                      .doctorsList[index]
                                                      .imgIcon!,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index].subCat!,
                                                style: GoogleFonts.almarai(
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
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index]
                                                    .location!,
                                                style: GoogleFonts.almarai(
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
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.price_change_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'سعر الكشف:',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kTextLightColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index].price!,
                                                style: GoogleFonts.almarai(
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
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'مدة الانتظار:',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index].waiting!,
                                                style: GoogleFonts.almarai(
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
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 35,
                                                width: 240,
                                                color: Colors.grey[200],
                                                child: Center(
                                                  child: Text(
                                                    'متاح اليوم 04:00م',
                                                    style: GoogleFonts.almarai(
                                                      textStyle: textCard,
                                                      color: kTextLightColor,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 35,
                                                width: 90,
                                                child: Center(
                                                  child: Text(
                                                    'احجز الان',
                                                    style: GoogleFonts.almarai(
                                                      textStyle: textCard,
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.redAccent[700],
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
