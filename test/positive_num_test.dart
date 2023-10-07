// ignore_for_file: unused_local_variable

import 'package:positive_num/positive_num.dart';
import 'package:test/test.dart';

void main() {
  group('PositiveNum', () {
    test('Ensure that a PositiveNum is created with a positive num', () {
      final nums1 = [0.001, 1, 0.1, 0.000001, 2, 1, 99999];
      final nums2 = [double.minPositive, double.maxFinite, double.infinity];
      for (var num in [...nums1, ...nums2]) {
        final (:error, :instance) = PositiveNum.create(num);
        expect(error, isNull);
        expect(instance!.value, greaterThan(0));
        expect(instance.value, equals(num));
      }
    });
    test('Ensure that a PositiveNum is not created with a non-positive num',
        () {
      final nums1 = [-5, -5.0, -0.001, -0.0, 0.0, 0];
      final nums2 = [double.nan, double.negativeInfinity];
      for (var num in [...nums1, ...nums2]) {
        final (:error, :instance) = PositiveNum.create(num);
        expect(error, isNotNull);
        expect(instance, isNull);
      }
    });
    test('Ensure that generic T has a proper type either int or double', () {
      // ensure that the value has type of 'int'
      int intValue = PositiveNum.create(1).instance!.value;

      // ensure that the value has type of 'double'
      double doubleValue = PositiveNum.create(1.0).instance!.value;
    });
    test('Ensure that "==" is overriden correctly', () {
      final num1 = PositiveNum.create(1).instance!;
      expect(num1, equals(num1));
      expect(num1, equals(PositiveNum.create(1).instance!));

      expect(num1, same(num1));
      expect(num1, isNot(same(PositiveNum.create(1).instance!)));
    });
    test('Ensure that "toString()" is overriden correctly', () {
      final num1 = PositiveNum.create(1).instance!;
      expect(num1.toString(), equals('1'));
    });
    test('Ensure that "hashCode" is overriden correctly', () {
      final num1 = PositiveNum.create(1).instance!;
      expect(num1.hashCode, equals(1.hashCode));
    });
  });
}
