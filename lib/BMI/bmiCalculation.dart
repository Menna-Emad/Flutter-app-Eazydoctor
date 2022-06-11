import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/material.dart';

class BmiCalculation extends StatelessWidget {
  static const String routeName= 'Bmi';
  final String bmiResult;
  final String tips;
  final String resultText;
  BmiCalculation (this.bmiResult, this.resultText, this.tips);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('BMI calculator'),
          backgroundColor: MyThemeData.primaryColor,),
          body: Column(
            children: [
              Container(height:double.infinity,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Text('your result'),
           ),
          Card(color:Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(resultText.toUpperCase()),
               Text(bmiResult),
               Text(tips),

              ],
            ),
          ),
            ],
          ),

        ),
      ],
    );
  }
}
