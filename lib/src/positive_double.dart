/// © Max Shemetov, 2023

part of 'package:positive_num/src/positive_num.dart';

final class PositiveDouble extends PositiveNum<double> {
  PositiveDouble._(double value) : super._(value);

  static ({String? error, PositiveDouble? instance}) create(double value) {
    return value > 0
        ? (error: null, instance: PositiveDouble._(value))
        : (error: _prepareErrorMessage(value), instance: null);
  }
}
