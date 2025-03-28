import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableDoubleExtension tests', () {
    test('orZero returns zero when double is null', () {
      const double? nullableDouble = null;
      expect(nullableDouble.orZero, equals(0.0));
    });

    test('orZero returns the double when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const double? nullableDouble = 5.5;
      expect(nullableDouble.orZero, equals(5.5));
    });

    test('or returns default value when double is null', () {
      const double? nullableDouble = null;
      expect(nullableDouble.or(defaultValue: 10.5), equals(10.5));
    });

    test('or returns the double when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const double? nullableDouble = 5.5;
      expect(nullableDouble.or(defaultValue: 10.5), equals(5.5));
    });

    group('isPositive tests', () {
      test('isPositive returns true for positive double', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = 5.5;
        expect(value.isPositive(), isTrue);
      });

      test('isPositive returns false for zero', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = 0.0;
        expect(value.isPositive(), isFalse);
      });

      test('isPositive returns false for negative double', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = -5.5;
        expect(value.isPositive(), isFalse);
      });

      test('isPositive returns false for null', () {
        const double? value = null;
        expect(value.isPositive(), isFalse);
      });
    });

    group('isNegative tests', () {
      test('isNegative returns true for negative double', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = -5.5;
        expect(value.isNegativeValue(), isTrue);
      });

      test('isNegative returns false for zero', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = 0.0;
        expect(value.isNegativeValue(), isFalse);
      });

      test('isNegative returns false for positive double', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        const double? value = 5.5;
        expect(value.isNegativeValue(), isFalse);
      });

      test('isNegative returns false for null', () {
        const double? value = null;
        expect(value.isNegativeValue(), isFalse);
      });
    });
  });

  group('DoubleExtension tests (client code)', () {
    test('notNullOrZero returns list with zeros for null values', () {
      final list = <double?>[null, 1.5, null, 2.5];
      final result = list.notNullOrZero();
      expect(result, equals([0.0, 1.5, 0.0, 2.5]));
    });

    test('notNullOrZero returns list with original values for non-null values',
        () {
      final list = <double?>[1.0, 2.0, 3.0];
      final result = list.notNullOrZero();
      expect(result, equals([1.0, 2.0, 3.0]));
    });

    test('notNullOrZero returns empty list for empty input', () {
      final list = <double?>[];
      final result = list.notNullOrZero();
      expect(result, isEmpty);
    });
  });
}

/// Client code example
extension DoubleExtension on List<double?> {
  List<double?> notNullOrZero() {
    return map((e) => e.orZero).toList();
  }
}
