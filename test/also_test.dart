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
}
