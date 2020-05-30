import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight}) {
    _calculateBMI();
  }

  final int height;
  final int weight;
  double _bmi;

  _calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi >= 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "You body weight is higher than normal";
    else if (_bmi >= 18.5)
      return "You have a very good body weight";
    else
      return "Your body weight is lower than normal";
  }
}
