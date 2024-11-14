import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableExtensions', () {
    test('isNull should return true if the object is null', () {
      const Object? value = null;
      expect(value.isNull, isTrue);
    });

    test('isNull should return false if the object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'Hello';
      expect(value.isNull, isFalse);
    });

    test('isNotNull should return true if the object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'Hello';
      expect(value.isNotNull, isTrue);
    });

    test('isNotNull should return false if the object is null', () {
      const Object? value = null;
      expect(value.isNotNull, isFalse);
    });

    test('let should perform operation if object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'Hello';
      final result = value.mapIfNotNull((it) => (it as String).length);
      expect(result, 5);
    });

    test('let should return null if object is null', () {
      const Object? value = null;
      final result = value.mapIfNotNull((it) => (it as String).length);
      expect(result, isNull);
    });

    test('run should execute action if object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'World';
      String? result;
      value.runWithAction((it) => result = 'Hello, ${it as String}');
      expect(result, 'Hello, World');
    });

    test('run should not execute action if object is null', () {
      const Object? value = null;
      String? result = 'Hello';
      value.runWithAction((it) => result = 'World');
      expect(result, 'Hello'); // Result should be unchanged
    });

    test('orDefault should return default if object is null', () {
      const Object? value = null;
      final result = value.orDefault('Default');
      expect(result, 'Default');
    });

    test('orDefault should return object if it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'Existing';
      final result = value.orDefault('Default');
      expect(result, 'Existing');
    });

    test('map should transform object if it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Object? value = 'Flutter';
      final result = value.map((it) => (it as String).length);
      expect(result, 7);
    });

    test('map should return null if object is null', () {
      const Object? value = null;
      final result = value.map((it) => (it as String).length);
      expect(result, isNull);
    });
  });
}
