import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('AlsoExtension tests', () {
    test('also applies closure to value and returns the same value', () {
      var value = 1;
      final result = value.also((item) => value = item * 2);
      expect(result, equals(1));
      expect(value, equals(2));
    });

    test('also applies closure to string and returns the same string', () {
      var value = 'Hello';
      final result = value.also((item) => value = item.toUpperCase());
      expect(result, equals('Hello'));
      expect(value, equals('HELLO'));
    });
  });

  group('String uppercasedNumbers (client code tests)', () {
    test('should extract and uppercase numbers from a string', () {
      expect('abc123def456'.uppercasedNumbers(), '123456');
    });

    test('should handle empty string', () {
      expect(''.uppercasedNumbers(), '');
    });

    test('should handle string with only numbers', () {
      expect('123456'.uppercasedNumbers(), '123456');
    });

    test('should handle string with no numbers', () {
      expect('abcdef'.uppercasedNumbers(), '');
    });

    test('should handle string with mixed characters', () {
      expect('a1b2c3d'.uppercasedNumbers(), '123');
    });
  });
}

/// Client code example
extension AlsoLibExtension on String {
  String uppercasedNumbers() {
    // ignore: avoid_print
    return toUpperCase().replaceAll(RegExp('[^0-9]'), '').also(print);
  }
}