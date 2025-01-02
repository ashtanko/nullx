import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('ConditionExtension tests', () {
    test(
        'should return conditionTrue result if object is not null and condition is true',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? number = 10;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(20));
    });

    test(
        'should return conditionFalse result if object is not null and condition is false',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? number = 3;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(-1));
    });

    test('should return conditionFalse result if object is null', () {
      const int? number = null;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(-1));
    });

    test(
        'uses default condition for non-null input when no condition is provided',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      final result = str.conditionNotNullAs(
        isTrue: (value) => 'True',
        isFalse: () => 'False',
      );
      expect(result, equals('True'));
    });

    test('ifNull calls action when the value is null', () {
      const int? value = null;
      bool wasCalled = false;

      value.ifNull(() {
        wasCalled = true;
      });

      expect(wasCalled, isTrue);
    });

    test('ifNull does not call action when the value is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 10;
      bool wasCalled = false;

      value.ifNull(() {
        wasCalled = true;
      });

      expect(wasCalled, isFalse);
    });

    test('ifNull returns the original value when the value is null', () {
      const int? value = null;

      final result = value.ifNull(() {});

      expect(result, isNull);
    });

    test('ifNull returns the original value when the value is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 10;

      final result = value.ifNull(() {});

      expect(result, equals(10));
    });

    test('returns isTrue when the object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      final result = value.notNullWith(
        isTrue: (v) => 'Value is $v',
        isFalse: () => 'Value is null',
      );
      expect(result, 'Value is test');
    });

    test('returns isFalse when the object is null', () {
      String? value;
      final result = value.notNullWith(
        isTrue: (v) => 'Value is $v',
        isFalse: () => 'Value is null',
      );
      expect(result, 'Value is null');
    });

    test('handles complex object correctly', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Map<String, dynamic>? map = {'key': 'value'};
      final result = map.notNullWith(
        isTrue: (v) => 'Map is not empty',
        isFalse: () => 'Map is null',
      );
      expect(result, 'Map is not empty');
    });

    test('handles null complex object', () {
      Map<String, dynamic>? map;
      final result = map.notNullWith(
        isTrue: (v) => 'Map is not empty',
        isFalse: () => 'Map is null',
      );
      expect(result, 'Map is null');
    });
  });
}
