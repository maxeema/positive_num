// ignore_for_file: unused_local_variable

import 'package:positive_num/positive_num.dart';

void main() {
  example1();
  example2();
}

void example1() {
  var someNumber = 1;
  //
  final (:error, :instance) = PositiveNum.create(someNumber);
  if (instance != null) {
    final positiveNum = instance;
    print('Created a PositiveNum instance with value $positiveNum.');
  } else {
    print('Error. $error');
  }
}

void example2() {
  const nums1 = [-5, -5.0, -0.001, -0.0, 0.0, 0];
  const nums2 = [0.1, 1, 999999];
  const nums3 = [double.nan, double.negativeInfinity];
  const nums4 = [double.minPositive, double.maxFinite, double.infinity];
  //
  for (final n in [...nums1, ...nums2, ...nums3, ...nums4]) {
    switch (PositiveNum.create(n)) {
      case (:String? error, :PositiveNum instance):
        final positiveNum = instance;
        print('SUCCESS [try $n] PositiveNum created with value $positiveNum.');
        break;
      case (:String error, :PositiveNum? instance):
        print('FAILURE [try $n] PositiveNum was not created. $error');
        break;
    }
  }
}
