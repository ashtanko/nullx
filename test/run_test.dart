import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('RunExtension tests', () {
    test('run applies closure to non-null value', () {
      const nonNullInt = 1;
      final result = nonNullInt.run((item) => item * 2);
      expect(result, equals(2));
    });

    test('run applies closure to non-null string', () {
      const nonNullString = 'Hello';
      final result = nonNullString.run((item) => item.toUpperCase());
      expect(result, equals('HELLO'));
    });
  });
}
