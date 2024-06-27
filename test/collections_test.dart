import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableMapExtension', () {
    test('mapNonNull maps non-null values correctly', () {
      final list = [1, null, 3, null];
      final newList = list.mapNonNull((item) => item * 2).toList();
      expect(newList, [2, 6]);
    });

    test('mapNonNull returns an empty iterable if all elements are null', () {
      final list = [null, null, null];
      final newList = list.mapNonNull((item) => item).toList();
      expect(newList, []);
    });

    test('mapNonNull handles empty iterables', () {
      final list = <int?>[];
      final newList = list.mapNonNull((item) => item).toList();
      expect(newList, []);
    });

    test('returns empty iterable for null input', () {
      final Iterable<int?> input = [null, null, null];
      final result = input.mapNonNullIndexed((item, index) => item * index);
      expect(result, isEmpty);
    });

    test('applies function to non-null elements and their indices', () {
      final Iterable<int?> input = [1, null, 3, null, 4];
      final result = input.mapNonNullIndexed((item, index) => item * index);
      expect(result, equals([0, 3, 8]));
    });

    test('ignores null elements', () {
      final Iterable<int?> input = [1, 2, null, 4];
      final result = input.mapNonNullIndexed((item, index) => item * index);
      expect(result, equals([0, 2, 8]));
    });
  });

  group('WhatIfNotNullOrEmptyExtension', () {
    test('whatIfNotNullOrEmpty calls whatIf if list is not null and not empty',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final List<int>? list = [1, 2, 3];
      var called = false;
      list.whatIfNotNullOrEmpty((l) {
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
      list.whatIfNotNullOrEmpty((l) {
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
      list.whatIfNotNullOrEmpty((l) {
        fail('whatIf should not be called');
      }, () {
        called = true;
      });
      expect(called, isTrue);
    });
  });

  group('CollectionExtensions', () {
    group('isNullOrEmpty', () {
      test('isNullOrEmpty returns true if list is null', () {
        const List<int>? list = null;
        expect(list.isNullOrEmpty, isTrue);
      });

      test('isNullOrEmpty returns true if list is empty', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final List<int>? list = [];
        expect(list.isNullOrEmpty, isTrue);
      });

      test('isNullOrEmpty returns false if list is not empty', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final List<int>? list = [1, 2, 3];
        expect(list.isNullOrEmpty, isFalse);
      });
    });

    group('filterNotNullTo', () {
      test('adds non-null elements to destination', () {
        final source = [1, null, 3, null];
        final destination = <int>[];
        source.filterNotNullTo(destination);
        expect(destination, equals([1, 3]));
      });

      test('adds non-null elements to destination with result', () {
        final source = [1, null, 3, null];
        final destination = <int>[];
        final res = source.filterNotNullTo(destination);
        expect(destination, equals([1, 3]));
        expect(res, equals([1, 3]));
      });

      test('returns the same destination if source is empty', () {
        final source = <int?>[];
        final destination = <int>[];
        source.filterNotNullTo(destination);
        expect(destination, isEmpty);
      });

      test('returns the same destination if source is null', () {
        const List<int?>? source = null;
        final destination = <int>[];
        source.filterNotNullTo(destination);
        expect(destination, isEmpty);
      });

      test('does not add null elements to destination', () {
        final source = <int?>[null, null, null];
        final destination = <int>[];
        source.filterNotNullTo(destination);
        expect(destination, isEmpty);
      });
    });

    group('filterNotNull', () {
      test('filters non-null elements from iterable', () {
        final source = [1, null, 3, null];
        final result = source.filterNotNull();
        expect(result, equals([1, 3]));
      });

      test('returns an empty iterable if source is empty', () {
        final source = <int?>[];
        final result = source.filterNotNull();
        expect(result, isEmpty);
      });

      test('returns an empty iterable if source is null', () {
        const List<int?>? source = null;
        final result = source.filterNotNull();
        expect(result, isEmpty);
      });

      test('does not include null elements in the result', () {
        final source = <int?>[null, null, null];
        final result = source.filterNotNull();
        expect(result, isEmpty);
      });
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
