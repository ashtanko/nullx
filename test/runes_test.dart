import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableRunesExtensions', () {
    test('orEmpty() should return empty Runes when null', () {
      Runes? nullRunes;
      expect(nullRunes.orEmpty(), equals(Runes('')));
    });

    test('orEmpty() should return original Runes when not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('Hello');
      expect(runes.orEmpty(), equals(runes));
    });

    test('isNullOrEmpty() should return true when null', () {
      Runes? nullRunes;
      expect(nullRunes.isNullOrEmpty(), isTrue);
    });

    test('isNullOrEmpty() should return true when empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? emptyRunes = Runes('');
      expect(emptyRunes.isNullOrEmpty(), isTrue);
    });

    test('isNullOrEmpty() should return false when not empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('Hello');
      expect(runes.isNullOrEmpty(), isFalse);
    });

    test('hasValue() should return false when null', () {
      Runes? nullRunes;
      expect(nullRunes.hasValue(), isFalse);
    });

    test('hasValue() should return false when empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? emptyRunes = Runes('');
      expect(emptyRunes.hasValue(), isFalse);
    });

    test('hasValue() should return true when not empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('Hello');
      expect(runes.hasValue(), isTrue);
    });

    test('map() should return empty iterable when null', () {
      Runes? nullRunes;
      expect(nullRunes.map((e) => e + 1), isEmpty);
    });

    test('map() should transform Runes when not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('abc');
      expect(
        runes.map((e) => e + 1),
        equals([98, 99, 100]),
      ); // Transformed to 'bcd'
    });

    test('joinAsString() should return empty string when null', () {
      Runes? nullRunes;
      expect(nullRunes.joinAsString(), equals(''));
    });

    test('joinAsString() should join Runes with default separator', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('abc');
      expect(runes.joinAsString(), equals('abc'));
    });

    test('joinAsString() should join Runes with custom separator', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('abc');
      expect(runes.joinAsString('-'), equals('a-b-c'));
    });

    test('firstOrNull() should return null when null', () {
      Runes? nullRunes;
      expect(nullRunes.firstOrNull(), isNull);
    });

    test('firstOrNull() should return null when empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? emptyRunes = Runes('');
      expect(emptyRunes.firstOrNull(), isNull);
    });

    test('firstOrNull() should return the first rune when not empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('abc');
      expect(runes.firstOrNull(), equals(97)); // 'a'
    });

    test('lastOrNull() should return null when null', () {
      Runes? nullRunes;
      expect(nullRunes.lastOrNull(), isNull);
    });

    test('lastOrNull() should return null when empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? emptyRunes = Runes('');
      expect(emptyRunes.lastOrNull(), isNull);
    });

    test('lastOrNull() should return the last rune when not empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Runes? runes = Runes('abc');
      expect(runes.lastOrNull(), equals(99)); // 'c'
    });
  });
}
