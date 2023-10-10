/// © Max Shemetov, 2023

part 'package:positive_num/src/positive_int.dart';
part 'package:positive_num/src/positive_double.dart';

String _prepareErrorMessage(num value) =>
    'Value should be > 0, but got $value instead.';

sealed class PositiveNum<T extends num> {
  const PositiveNum._(this.value);

  final T value;

  @override
  operator ==(Object other) =>
      identical(other, this) || other is PositiveNum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$value';

  static ({String? error, PositiveNum<T>? instance}) create<T extends num>(
      T value) {
    return switch (value) {
      > 0 => value is int
          ? (error: null, instance: PositiveInt._(value) as PositiveNum<T>)
          : (
              error: null,
              instance: PositiveDouble._(value as double) as PositiveNum<T>
            ),
      _ => (
          error: _prepareErrorMessage(value),
          instance: null,
        )
    };
  }
}
