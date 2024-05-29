import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableMapExtension', () {
    test('mapNonNull transforms non-null elements', () {
      final list = [1, null, 3, null];
      final result = list.mapNonNull((item) => item * 2);

      expect(result, equals([2, 6]));
    });

    test('mapNonNull ignores null elements', () {
      final list = [null, null];
      final result = list.mapNonNull((item) => item.let((it) => it));

      expect(result, isEmpty);
    });

    test('mapNonNull with all non-null elements', () {
      final list = [1, 2, 3, 4];
      final result = list.mapNonNull((item) => item * 2);

      expect(result, equals([2, 4, 6, 8]));
    });

    test('mapNonNull with empty list', () {
      final list = <int?>[];
      final result = list.mapNonNull((item) => item * 2);

      expect(result, isEmpty);
    });

    test('whatIfNotNullOrEmptyListTest', () {
      List<String>? list;

      list.whatIfNotNullOrEmpty(
        (values) => list = ['NotNullOrEmpty'],
        () => list = ['NullOrEmpty'],
      );

      expect(list?[0], 'NullOrEmpty');

      list.whatIfNotNullOrEmpty(
        (values) => list = ['Not${values[0]}'],
        () => list = ['NullOrEmpty'],
      );

      expect(list?[0], 'NotNullOrEmpty');
    });
  });
}
