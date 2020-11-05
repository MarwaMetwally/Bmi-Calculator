import 'dart:math';

class BMICalculator {
  int height;
  int weight;
  double _bmi;
  BMICalculator(this.weight, this.height);
  String calcbmi() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal weight body weight .Try to excercise more ';
    } else if (_bmi > 18.5) {
      return 'YOu have a normal body weight .GOOD JOb!';
    } else {
      return 'You have a lower than normal weight body weight . You can Eat a bit more';
    }
  }
}
