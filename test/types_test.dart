import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('isPositive tests', () {
    test('isPositive returns true for positive integer', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 5;
      expect(value.isPositive(), isTrue);
    });

    test('isPositive returns false for zero', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 0;
      expect(value.isPositive(), isFalse);
    });

    test('isPositive returns false for negative integer', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = -5;
      expect(value.isPositive(), isFalse);
    });

    test('isPositive returns false for null', () {
      const int? value = null;
      expect(value.isPositive(), isFalse);
    });
  });

  group('isNegative tests', () {
    test('isNegative returns true for negative integer', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = -5;
      expect(value.isNegativeValue(), isTrue);
    });

    test('isNegative returns false for zero', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 0;
      expect(value.isNegativeValue(), isFalse);
    });

    test('isNegative returns false for positive integer', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 5;
      expect(value.isNegativeValue(), isFalse);
    });

    test('isNegative returns false for null', () {
      const int? value = null;
      expect(value.isNegativeValue(), isFalse);
    });
  });
}
