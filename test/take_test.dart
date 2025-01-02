import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('Take Extensions tests', () {
    test('takeIf should return value if predicate is true', () {
      const value = 10;
      final result = value.takeIf((value) => value > 5);
      expect(result, equals(value));
    });

    test('takeIf should return null if predicate is false', () {
      const value = 10;
      final result = value.takeIf((value) => value > 20);
      expect(result, isNull);
    });

    test('takeIf should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.takeIf((value) => value.isNotEmpty);
      expect(resultString, equals(stringValue));

      final listValue = [1, 2, 3];
      final resultList = listValue.takeIf((value) => value.isNotEmpty);
      expect(resultList, equals(listValue));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.takeIf((value) => value.isNotEmpty);
      expect(resultMap, equals(mapValue));
    });

    test('takeUnless should return null if predicate is true', () {
      const value = 10;
      final result = value.takeUnless((value) => value > 5);
      expect(result, isNull);
    });

    test('takeUnless should return value if predicate is false', () {
      const value = 10;
      final result = value.takeUnless((value) => value > 20);
      expect(result, equals(value));
    });

    test('takeUnless should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.takeUnless((value) => value.isEmpty);
      expect(resultString, equals(stringValue));

      final listValue = [1, 2, 3];
      final resultList = listValue.takeUnless((value) => value.isEmpty);
      expect(resultList, equals(listValue));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.takeUnless((value) => value.isEmpty);
      expect(resultMap, equals(mapValue));
    });
  });
}
