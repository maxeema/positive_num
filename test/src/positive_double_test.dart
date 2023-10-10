/// © Max Shemetov, 2023

import 'package:positive_num/positive_num.dart';
import 'package:test/test.dart';

void main() {
  group('PositiveDouble', () {
    test('ensure create() returns PositiveDouble', () {
      const double number = 2.2;
      expect(PositiveDouble.create(number).instance, isA<PositiveDouble>());
    });
    test('ensure creates new instance with a positive number', () {
      const numbers = <double>[0.1, 2.2, 10.0, 99.999, 9999476597346.5];
      for (final number in numbers) {
        final (:error, :instance) = PositiveDouble.create(number);
        expect(error, null);
        expect(instance!.value, greaterThan(0));
        expect(instance.value, number);
      }
    });
    test('ensure doesn\'t create new instance with a non-positive number', () {
      const numbers = <double>[-0.0, 0, -0.002, -2, -999.99, -9999476597346.5];
      for (final number in numbers) {
        final (:error, :instance) = PositiveDouble.create(number);
        expect(error, isNotNull);
        expect(instance, null);
      }
    });
    test('ensure "==" overridden correctly', () {
      final number = PositiveDouble.create(2.2).instance!;
      expect(number, equals(number));
      expect(number, equals(PositiveDouble.create(2.2).instance));
      expect(number, same(number));
      expect(number, isNot(same(PositiveDouble.create(2.2).instance)));
    });
    test('ensure "toString()" overridden correctly', () {
      expect(PositiveDouble.create(2.2).instance.toString(), '2.2');
      expect(PositiveDouble.create(999.9).instance.toString(), '999.9');
      expect(PositiveDouble.create(100).instance.toString(), '100.0');
    });
    test('ensure "hashCode" overridden correctly', () {
      expect(PositiveDouble.create(2.2).instance.hashCode, 2.2.hashCode);
      expect(PositiveDouble.create(999.9).instance.hashCode, 999.9.hashCode);
      expect(PositiveDouble.create(100).instance.hashCode, 100.hashCode);
    });
  });
}
