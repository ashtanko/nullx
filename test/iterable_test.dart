import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableIterableExtension', () {
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

    group('safeLength tests', () {
      test('safeLength returns 0 for null iterable', () {
        const Iterable<int>? iterable = null;
        expect(iterable.safeLength(), equals(0));
      });

      test('safeLength returns correct length for non-null iterable', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final Iterable<int>? iterable = [1, 2, 3];
        expect(iterable.safeLength(), equals(3));
      });

      test('safeLength returns 0 for empty iterable', () {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final Iterable<int>? iterable = [];
        expect(iterable.safeLength(), equals(0));
      });
    });
  });

  group('firstOrNullIndexWhere', () {
    test('returns the first element that matches the test', () {
      final list = [1, 2, 3, 4];
      final result = list.firstOrNullIndexWhere((item) => item > 2);
      expect(result, 3);
    });

    test('returns null if no elements match the test', () {
      final list = [1, 2, 3, 4];
      final result = list.firstOrNullIndexWhere((item) => item > 4);
      expect(result, null);
    });

    test('ignores null elements and returns the first non-null element that matches the test', () {
      final list = [null, 2, null, 4];
      final result = list.firstOrNullIndexWhere((item) => item > 1);
      expect(result, 2);
    });

    test('returns null if the list is empty', () {
      final list = <int>[];
      final result = list.firstOrNullIndexWhere((item) => item > 1);
      expect(result, null);
    });

    test('returns null if the list is null', () {
      const List<int>? list = null;
      final result = list?.firstOrNullIndexWhere((item) => item > 1);
      expect(result, null);
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

  group('lastOrNull', () {
    test('returns last element when collection is not empty', () {
      final List<int> numbers = [1, 2, 3];
      expect(numbers.lastOrNull(), 3);
    });

    test('returns null when collection is empty', () {
      final List<int> numbers = [];
      expect(numbers.lastOrNull(), null);
    });

    test('returns null when collection is null', () {
      List<int>? numbers;
      expect(numbers.lastOrNull(), null);
    });
  });

  group('reduceOrNull', () {
    test('returns result of reduce when collection is not empty', () {
      final List<int> numbers = [1, 2, 3];
      expect(numbers.reduceOrNull((a, b) => a! + b!), 6);
    });

    test('returns null when collection is empty', () {
      final List<int> numbers = [];
      expect(numbers.reduceOrNull((a, b) => a! + b!), null);
    });

    test('returns null when collection is null', () {
      List<int>? numbers;
      expect(numbers.reduceOrNull((a, b) => a! + b!), null);
    });
  });

  group('singleOrNull', () {
    test('returns the element when collection has one element', () {
      final List<int> numbers = [1];
      expect(numbers.singleOrNull(), 1);
    });

    test('returns null when collection has more than one element', () {
      final List<int> numbers = [1, 2];
      expect(numbers.singleOrNull(), null);
    });

    test('returns null when collection is empty', () {
      final List<int> numbers = [];
      expect(numbers.singleOrNull(), null);
    });

    test('returns null when collection is null', () {
      List<int>? numbers;
      expect(numbers.singleOrNull(), null);
    });
  });
}
