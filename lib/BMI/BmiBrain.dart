import 'dart:math';

class BmiBrain {
  final double height;
  final double weight;

  BmiBrain({required this.weight,required this.height,required this.bmi});
  var bmi;
  String calculateBMI(){
    bmi= weight/pow(height, 100.2);
    return bmi.toStringAsFixed(1);
  }
  String getResult() {
    if (bmi >= 25) {
      return 'overweiht';
    } else if (bmi > 18.5) {
      return 'normal';
    }
    else {
      return 'UnderWeight';
    }
  }
  String Tips(){
    if (bmi>=25){return 'You have a higher than normal body weight. Try to exercise';}
    else if (bmi>=18.5){return ' You have a normal body weight. Good job';}
    else {
      return ' You have a lower than normal body weight. You can eat a bit more';
    }
  }
}