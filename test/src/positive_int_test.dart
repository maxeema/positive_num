/// © Max Shemetov, 2023

import 'package:positive_num/positive_num.dart';
import 'package:test/test.dart';

void main() {
  group('PositiveInt', () {
    test('ensure create() returns PositiveInt', () {
      const int number = 1;
      expect(PositiveInt.create(number).instance, isA<PositiveInt>());
    });
    test('ensure creates new instance with a positive number', () {
      const numbers = <int>[1, 2, 100, 99999, 99994765973465];
      for (final number in numbers) {
        final (:error, :instance) = PositiveInt.create(number);
        expect(error, null);
        expect(instance!.value, greaterThan(0));
        expect(instance.value, number);
      }
    });
    test('ensure doesn\'t create new instance with a non-positive number', () {
      const numbers = <int>[-0, 0, -1, -2, -100, -99999, -99994765973465];
      for (final number in numbers) {
        final (:error, :instance) = PositiveInt.create(number);
        expect(error, isNotNull);
        expect(instance, null);
      }
    });
    test('ensure "==" overridden correctly', () {
      final number = PositiveInt.create(1).instance!;
      expect(number, equals(number));
      expect(number, equals(PositiveInt.create(1).instance));
      expect(number, same(number));
      expect(number, isNot(same(PositiveInt.create(1).instance)));
    });
    test('ensure "toString()" overridden correctly', () {
      expect(PositiveInt.create(1).instance.toString(), '1');
      expect(PositiveInt.create(9999).instance.toString(), '9999');
    });
    test('ensure "hashCode" overridden correctly', () {
      expect(PositiveInt.create(1).instance.hashCode, 1.hashCode);
      expect(PositiveInt.create(9999).instance.hashCode, 9999.hashCode);
    });
  });
}
