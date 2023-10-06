//

class PositiveNum<T extends num> {
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
    return value > 0
        ? (error: null, instance: PositiveNum._(value))
        : (
            error: 'Value should be > 0, but got $value instead.',
            instance: null
          );
  }
}
