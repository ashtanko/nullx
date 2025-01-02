import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableStringExtensions tests', () {
    test('isNullOrEmpty returns true for null string', () {
      const String? str = null;
      expect(str.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty returns true for empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = '';
      expect(str.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty returns false for non-empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      expect(str.isNullOrEmpty, isFalse);
    });

    test('orDefault returns the string if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      expect(str.orDefault('Default'), equals('Hello'));
    });

    test('orDefault returns default value for null string', () {
      const String? str = null;
      expect(str.orDefault('Default'), equals('Default'));
    });

    test('returns true when the string is not null and not empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'Hello, world!';

      expect(value.hasValue, isTrue);
    });

    test('returns false when the string is empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = '';

      expect(value.hasValue, isFalse);
    });

    test('returns false when the string is null', () {
      String? value;

      expect(value.hasValue, isFalse);
    });

    test('calls the function with a non-null, non-empty string', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.notEmpty((v) {
        called = true;
        expect(v, value);
      });
      expect(called, isTrue);
    });

    test('does not call the function with a null string', () {
      var called = false;
      const String? value = null;
      value.notEmpty((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('does not call the function with an empty string', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = '';
      value.notEmpty((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('calls the function with the correct type', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.notEmpty((v) {
        called = true;
        expect(v, isA<String>());
        expect(v, value);
      });
      expect(called, isTrue);
    });
  });
}
