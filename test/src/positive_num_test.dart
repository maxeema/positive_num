/// © Max Shemetov, 2023

import 'package:positive_num/positive_num.dart';
import 'package:test/test.dart';

void main() {
  group('PositiveNum', () {
    test('ensure create() returns either PositiveInt or PositiveDouble', () {
      const intNum = 1;
      expect(PositiveNum.create(intNum).instance, isA<PositiveInt>());
      const doubleNum = 2.2;
      expect(PositiveNum.create(doubleNum).instance, isA<PositiveDouble>());
    });
    test('ensure creates new instance with a positive number', () {
      const nums1 = <num>[0.001, 1, 0.1, 0.000001, 2, 1, 99999];
      const nums2 = <num>[
        double.minPositive,
        double.maxFinite,
        double.infinity
      ];
      for (final number in const [...nums1, ...nums2]) {
        final (:error, :instance) = PositiveNum.create(number);
        expect(error, null);
        expect(instance!.value, greaterThan(0));
        expect(instance.value, number);
      }
    });
    test('ensure doesn\'t create new instance with a non-positive number', () {
      const nums1 = <num>[-5, -5.0, -0.001, -0.0, 0.0, 0];
      const nums2 = <num>[double.nan, double.negativeInfinity];
      for (final number in const [...nums1, ...nums2]) {
        final (:error, :instance) = PositiveNum.create(number);
        expect(error, isNotNull);
        expect(instance, null);
      }
    });
    test('ensure generic T has a proper type either int or double', () {
      expect(PositiveNum.create(1).instance!.value, isA<int>());
      expect(PositiveNum.create(2.2).instance!.value, isA<double>());
    });
    test('ensure "==" overridden correctly', () {
      final num1 = PositiveNum.create(1).instance!;
      expect(num1, equals(num1));
      expect(num1, equals(PositiveNum.create(1).instance));
      expect(num1, same(num1));
      expect(num1, isNot(same(PositiveNum.create(1).instance)));
      final num2 = PositiveNum.create(2.2).instance!;
      expect(num2, equals(num2));
      expect(num2, equals(PositiveNum.create(2.2).instance));
      expect(num2, same(num2));
      expect(num2, isNot(same(PositiveNum.create(2.2).instance)));
    });
    test('ensure "toString()" overridden correctly', () {
      expect(PositiveNum.create(1).instance.toString(), '1');
      expect(PositiveNum.create(2.2).instance.toString(), '2.2');
    });
    test('ensure "hashCode" overridden correctly', () {
      expect(PositiveNum.create(1).instance.hashCode, 1.hashCode);
      expect(PositiveNum.create(2.2).instance.hashCode, 2.2.hashCode);
    });
  });
}
