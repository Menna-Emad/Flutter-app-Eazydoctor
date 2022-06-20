import 'package:eazyydoctor/BMI/ResultPage.dart';
import 'package:eazyydoctor/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eazyydoctor/BMI/calcbrain.dart';

class BmiTap extends StatefulWidget {
  @override
  _BmiTapState createState() => _BmiTapState();
}

class _BmiTapState extends State<BmiTap> {
  int height = 180;
  int weight = 30;
  int age = 18;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/x1.0/bmi.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 75.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      radioButton('MAN', Colors.blue, 0),
                      radioButton('WOMAN', Colors.pinkAccent, 1)
                    ],
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      color: MyThemeData.cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(fontSize: 25),
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                thumbColor: MyThemeData.primaryColor,
                                overlayColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 30.0),
                              ),
                              child: Slider(
                                  value: height.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  onChanged: (double newvalue) {
                                    setState(() {
                                      height = newvalue.round();
                                    });
                                  })),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(fontSize: 30),
                              ),
                              Text('cm'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          color: MyThemeData.cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(fontSize: 23),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                weight.toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (weight > 1) weight--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        size: 30,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          color: MyThemeData.cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (age > 1) age--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        size: 30,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        CalculatorBrain calc =
                            CalculatorBrain(height: height, weight: weight);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    interpretation: calc.getInterpretation())));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: MyThemeData.cardColor),
                      child: Text('Calculate'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 150.0,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          color: currentIndex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            child: Center(
                child: Text(
              value,
              style: TextStyle(
                color: currentIndex == index ? Colors.white : color,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            onTap: () {
              changeIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
