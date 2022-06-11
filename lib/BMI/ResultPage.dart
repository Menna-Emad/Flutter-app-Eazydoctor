
import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/material.dart';
import 'Reusablecard.dart';
import 'package:flutter/cupertino.dart';

class ResultPage extends StatelessWidget {
  //static const routeName = 'result';
  ResultPage({required this.bmiResult,   required this.resultText,  required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    //var resultPage = ModalRoute.of(context)!.settings.arguments as ResultPage;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(padding: EdgeInsets.all(10),
            child: Center(

              child: Text(
                'Your Result',style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: MyThemeData.primaryColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(fontSize: 30),

                  ),
                  Column(
                    children:[Text('Your BMI',style: TextStyle(fontSize: 30),),
            Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmiResult,
                          style: TextStyle(fontSize: 45),
                        ),Text('%',style: TextStyle(fontSize: 45),),
                      ],
                    ),
                ],  ),
                  Text(
                    interpretation,
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.amber,
                child: Center(
                  child: Text('ReCalculate'),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.only(bottom: 5.0),
              height: 70.0,
            ),
          ),
        ],
      ),
    );
  }
}