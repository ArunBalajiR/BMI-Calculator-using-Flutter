import 'dart:math';

class BMIlogic {
  BMIlogic({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSubtitle() {
    if (_bmi >= 25) {
      return 'You have higher than a normal body weight. Try to Exercise more.';
    } else if (_bmi > 18.5) {
      return 'Your have a Nomal body weight. Good Job.';
    } else {
      return 'You have a lower than a normal body weight.You can eat a bit more.';
    }
  }
}
