import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eazyydoctor/constants.dart';
import 'package:eazyydoctor/screens/doctors_screen.dart';
import 'package:eazyydoctor/screens/active_reservation.dart ';
import 'package:eazyydoctor/notifier/specialist_notifier.dart';
import 'package:eazyydoctor/api/doctor_api.dart';
import 'package:provider/provider.dart';

class SpecialistScreen extends StatefulWidget {
  @override
  _SpecialistScreenState createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  @override
  void initState() {
    SpecialistNotifier specialistNotifier =
        Provider.of<SpecialistNotifier>(context, listen: false);

    getSpecialist(specialistNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SpecialistNotifier specialistNotifier =
        Provider.of<SpecialistNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'اختر التخصص',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'التخصصات الأكثر اختيارا',
              style: GoogleFonts.almarai(
                textStyle: textCard,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: specialistNotifier.specialistList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorsScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  specialistNotifier
                                      .specialistList[index].imgIcon,
                                  // "https://cdn-dr-images.vezeeta.com/Specialties/Dermatology.png",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                specialistNotifier.specialistList[index].name,
                                // "جلدية",
                                style: GoogleFonts.almarai(
                                  textStyle: textCard,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 350.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
