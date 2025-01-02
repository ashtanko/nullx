import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('LetExtension', () {
    test('let should return result of block if object is not null', () {
      const nullableString = 'Hello';
      final result = nullableString.let((value) => value.toUpperCase());
      expect(result, equals('HELLO'));
    });

    test('let should return null if object is null', () {
      const nullableString = null;
      // ignore: avoid_dynamic_calls
      final result = nullableString?.let((value) => value.toUpperCase());
      expect(result, isNull);
    });

    test('let should call the block function and return its result', () {
      const value = 10;
      final result = value.let((value) => 'The number is: $value');
      expect(result, equals('The number is: 10'));
    });

    test('let should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.let((value) => value.toUpperCase());
      expect(resultString, equals('HELLO'));

      final listValue = [1, 2, 3];
      final resultList = listValue.let((value) => value.length);
      expect(resultList, equals(3));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.let((value) => value.keys.toList());
      expect(resultMap, equals(['key']));
    });

    test('letNonNull should return result of block if object is not null', () {
      const nullableString = 'Hello';
      final result = nullableString.letNonNull((value) => value.toUpperCase());
      expect(result, equals('HELLO'));
    });

    test('letNonNull should return null if object is null', () {
      const nullableString = null;
      // ignore: avoid_dynamic_calls
      final result = nullableString?.letNonNull((value) => value.toUpperCase());
      expect(result, isNull);
    });

    test('letNonNull should work with different types', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 10;
      final resultInt = nullableInt.letNonNull((value) => value * 2);
      expect(resultInt, equals(20));

      final nullableList = [1, 2, 3];
      final resultList = nullableList.letNonNull((value) => value.length);
      expect(resultList, equals(3));

      final nullableMap = {'key': 'value'};
      final resultMap = nullableMap.letNonNull((value) => value.keys.toList());
      expect(resultMap, equals(['key']));
    });
  });
}
