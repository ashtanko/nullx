import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('WhatIfNotNullOrEmptyExtension tests', () {
    test('whatIfNotNullOrEmpty calls whatIf if list is not null and not empty',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final List<int>? list = [1, 2, 3];
      var called = false;
      list.ifNotNullOrEmpty((l) {
        called = true;
        expect(l, [1, 2, 3]);
      }, () {
        fail('whatIfNot should not be called');
      });
      expect(called, isTrue);
    });

    test('whatIfNotNullOrEmpty calls whatIfNot if list is null', () {
      const List<int>? list = null;
      var called = false;
      list.ifNotNullOrEmpty((l) {
        fail('whatIf should not be called');
      }, () {
        called = true;
      });
      expect(called, isTrue);
    });

    test('whatIfNotNullOrEmpty calls whatIfNot if list is empty', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final List<int>? list = [];
      var called = false;
      list.ifNotNullOrEmpty((l) {
        fail('whatIf should not be called');
      }, () {
        called = true;
      });
      expect(called, isTrue);
    });
  });

  group('listOfNotNull', () {
    test('filters non-null elements from list', () {
      final source = [1, null, 3, null];
      final result = listOfNotNull(source);
      expect(result, equals([1, 3]));
    });

    test('returns an empty list if source is empty', () {
      final source = <int?>[];
      final result = listOfNotNull(source);
      expect(result, isEmpty);
    });

    test('does not include null elements in the result', () {
      final source = <int?>[null, null, null];
      final result = listOfNotNull(source);
      expect(result, isEmpty);
    });

    test('returns a growable list if growable is true', () {
      final source = [1, null, 3, null];
      final result = listOfNotNull(source);
      expect(result, equals([1, 3]));
      result.add(4);
      expect(result, equals([1, 3, 4])); // check if list is growable
    });

    test('returns a fixed-length list if growable is false', () {
      final source = [1, null, 3, null];
      final result = listOfNotNull(source, growable: false);
      expect(result, equals([1, 3]));
      expect(
        () => result.add(4),
        throwsUnsupportedError,
      ); // check if list is fixed-length
    });
  });
}
