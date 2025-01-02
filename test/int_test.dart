import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  group('NullableIntX extension', () {
    test('orZero returns zero when integer is null', () {
      const int? nullableInt = null;
      expect(nullableInt.orZero, equals(0));
    });

    test('orZero returns the integer when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 5;
      expect(nullableInt.orZero, equals(5));
    });

    test('or returns default value when integer is null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = null;
      expect(nullableInt.or(defaultValue: 10), equals(10));
    });

    test('or returns the integer when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 5;
      expect(nullableInt.or(defaultValue: 10), equals(5));
    });

    test('or returns the integer in inner nullable class', () {
      final node = Node();
      final actual = node.value.or(defaultValue: 10);
      expect(actual, equals(10));
    });
  });
}
