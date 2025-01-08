import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableBoolExtension tests', () {
    test('orFalse returns false when boolean is null', () {
      const bool? nullableBool = null;
      expect(nullableBool.orFalse, isFalse);
    });

    test('orFalse returns the boolean when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const bool? nullableBool = true;
      expect(nullableBool.orFalse, isTrue);
    });

    test('or returns default value when boolean is null', () {
      const bool? nullableBool = null;
      expect(nullableBool.or(defaultValue: true), isTrue);
    });

    test('or returns the boolean when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const bool? nullableBool = false;
      expect(nullableBool.or(defaultValue: true), isFalse);
    });
  });

  group('ListBoolExtension tests (client code)', () {
    test('notNullOrFalse returns list with false for null values', () {
      const list = [true, null, false];
      expect(list.notNullOrFalse, [true, false, false]);
    });

    test('notNullOrFalse returns list with original values for non-null values',
        () {
      const list = [true, false, true];
      expect(list.notNullOrFalse, [true, false, true]);
    });
  });
}

/// Client code example
extension ListBoolExtension on List<bool?> {
  List<bool> get notNullOrFalse => map((e) => e.orFalse).toList();
}
