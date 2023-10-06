// ignore_for_file: unused_local_variable

import 'package:positive_num/positive_num.dart';

void main() {
  example1();
  example2();
}

void example1() {
  var number = 1;
  final result = PositiveNum.create(number);
  if (result.instance != null) {
    final positiveNum = result.instance!;
    print('Created a PositiveNum instance with ${positiveNum.value} value.');
  } else {
    final error = result.error;
    print('$error');
  }
}

void example2() {
  const nums1 = [-5, -5.0, -0.001, -0.0, 0.0, 0];
  const nums2 = [0.1, 1, 999999];
  const nums3 = [double.nan, double.negativeInfinity];
  const nums4 = [double.minPositive, double.maxFinite, double.infinity];

  for (final n in [...nums1, ...nums2, ...nums3, ...nums4]) {
    switch (PositiveNum.create(n)) {
      case (:String? error, :PositiveNum instance):
        print(
            'SUCCESS [try $n] PositiveNum with value ${instance.value} created successfully.');
        break;
      case (:String error, :PositiveNum? instance):
        print('FAILURE [try $n] PositiveNum was not created. $error');
        break;
    }
  }
}
