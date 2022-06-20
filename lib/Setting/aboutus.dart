import 'package:flutter/material.dart';

import '../themeData.dart';
class Aboutus extends StatefulWidget {
  static const routeName = 'Aboutus';

  @override
  _AboutusState createState() => _AboutusState();

}
class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/x1.0/news.png'),fit: BoxFit.cover,)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: [
              Container(height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage("assets/images/x1.0/logo.png"),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              SizedBox(height: 10.0,),
              Container( decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
              ),
                child: Text('About Us',
                  style: TextStyle(color: MyThemeData.primaryColor,
                      fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 40.0,),
              Container(
                child: Text('Eazy Doctor.com . '
                    'We are pioneering the shift to automated physician, clinic and hospital bookings making healthcare easily accessible in the region. '
                    'We strive to lead every aspect of the healthcare industry and continue to launch products that have positive impact on people’s lives.'
                    'the big dream of our team is to make a bracelet for each member in family which is connected to the application  '
                    'This web application purpose is to fetch people personal information and medical records, '
                    'depending on the authorization of the actor trying to access'
                    ' this information to provide the right medical procedure and care on the spot. Specially after 2020 with Covid-19 and the quarantine '
                    'it was very hard to go outside or find a good doctor near of you and make an appointment in a short time.'
                    ' On the other hand, if people are not aware of disease and health care options'
                    ' it keeps them from taking preventative action or from visiting their doctor.'
                    ' High-quality health care helps prevent diseases and improve quality of life. '
                    'Healthcare focuses on improving health care quality and making sure all people get the health care services they need. ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),),

            ],
            ),
          ),
        ),
      ),
    );
  }
}