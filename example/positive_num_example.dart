/// © Max Shemetov, 2023

// ignore_for_file: unused_local_variable

import 'package:positive_num/positive_num.dart';

void examplePositiveInt(int someNumber) {
  final (:error, :instance) = PositiveInt.create(someNumber);
  if (instance != null) {
    final positiveInt = instance;
    print('Created a PositiveInt, value: $positiveInt');
  } else {
    print('Error. $error');
  }
}

void examplePositiveDouble(double someNumber) {
  final result = PositiveDouble.create(someNumber);
  if (result.instance != null) {
    final positiveDouble = result.instance!;
    print('Created a PositiveDouble, value: $positiveDouble');
  } else {
    print('Error. ${result.error}');
  }
}

void examplePositiveNum(num someNumber) {
  switch (PositiveNum.create(someNumber)) {
    case (:String? error, :PositiveNum instance):
      final positiveNum = instance;
      print('Created a PositiveNum, value: $positiveNum');
      break;
    case (:String error, :PositiveNum? instance):
      print('Error. $error');
      break;
  }
}

void main() {
  examplePositiveInt(1);
  examplePositiveDouble(2.2);
  examplePositiveNum(3);
  //
  examplePositiveInt(-1);
  examplePositiveDouble(-2.2);
  examplePositiveNum(-3);
}
