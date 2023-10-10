/// © Max Shemetov, 2023

part of 'package:positive_num/src/positive_num.dart';

final class PositiveInt extends PositiveNum<int> {
  PositiveInt._(int value) : super._(value);

  static ({String? error, PositiveInt? instance}) create(int value) {
    return value > 0
        ? (error: null, instance: PositiveInt._(value))
        : (error: _prepareErrorMessage(value), instance: null);
  }
}
