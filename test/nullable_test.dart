import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('Nullable Extension', () {
    test('should return the value if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      expect(name.orThrow('Name cannot be null'), equals('John'));
    });

    test('should throw an exception if null', () {
      String? nullName;
      expect(() => nullName.orThrow('Name cannot be null'), throwsException);
    });

    test('should throw the correct exception message', () {
      String? nullName;
      expect(
        () => nullName.orThrow('Custom error message'),
        throwsA(
          predicate((e) => e.toString().contains('Custom error message')),
        ),
      );
    });

    test('calls the function with a non-null value', () {
      var called = false;
      const value = 42;
      value.unwrapped((v) {
        called = true;
        expect(v, value);
      });
      expect(called, isTrue);
    });

    test('does not call the function with a null value', () {
      var called = false;
      const int? value = null;
      value.unwrapped((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('calls the function with the correct type', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.unwrapped((v) {
        called = true;
        expect(v, isA<String>());
        expect(v, value);
      });
      expect(called, isTrue);
    });

    test('should return the value if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      expect(name.orElseGet(() => 'Default Name'), equals('John'));
    });

    test('should return the computed value if null', () {
      String? nullName;
      expect(nullName.orElseGet(() => 'Default Name'), equals('Default Name'));
    });

    test('should call the supplier function only if null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      bool wasCalled = false;

      name.orElseGet(() {
        wasCalled = true;
        return 'Default Name';
      });

      expect(wasCalled, isFalse);

      String? nullName;
      nullName.orElseGet(() {
        wasCalled = true;
        return 'Default Name';
      });

      expect(wasCalled, isTrue);
    });
  });
}
