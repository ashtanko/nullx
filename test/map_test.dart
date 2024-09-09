import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableMapExtensions', () {
    Map<String, int>? nullableMap;
    setUp(() {
      nullableMap = {'a': 1, 'b': 2};
    });

    test('isNotNullOrEmpty returns true for non-empty map', () {
      expect(nullableMap.isNotNullOrEmpty, isTrue);
    });

    test('isNotNullOrEmpty returns false for null map', () {
      nullableMap = null;
      expect(nullableMap.isNotNullOrEmpty, isFalse);
    });

    test('orDefault returns same map if not null', () {
      final result = nullableMap.orDefault({'c': 3});
      expect(result, equals({'a': 1, 'b': 2}));
    });

    test('orDefault returns default map if null', () {
      nullableMap = null;
      final result = nullableMap.orDefault({'c': 3});
      expect(result, equals({'c': 3}));
    });

    test('getOrElse returns value for existing key', () {
      final value = nullableMap.getOrElse('a', 0);
      expect(value, equals(1));
    });

    test('getOrElse returns default value for non-existing key', () {
      final value = nullableMap.getOrElse('c', 0);
      expect(value, equals(0));
    });

    test('putIfAbsentOrElse adds new key-value if key does not exist', () {
      nullableMap.putIfAbsentOrElse('c', 3);
      expect(nullableMap, containsPair('c', 3));
    });

    test('putIfAbsentOrElse does not overwrite existing key', () {
      nullableMap.putIfAbsentOrElse('a', 0);
      expect(nullableMap, containsPair('a', 1));
    });

    test('updateValue updates value for existing key', () {
      nullableMap.updateValue('a', (oldValue) => oldValue! + 1);
      expect(nullableMap, containsPair('a', 2));
    });

    group('Map filter tests', () {
      test('filter on null should return empty map', () {
        const Map<String, int>? nullMap = null;
        final result = nullMap.filter((entry) => entry.key == 'a');
        expect(result.length, equals(0));
        expect(result, equals({}));
      });

      test('filter retains only entries that match the test', () {
        final result = nullableMap.filter((entry) => entry.key == 'a');
        expect(result.length, equals(1));
        expect(result, containsPair('a', 1));
      });

      test('filters map based on condition', () {
        final map = <String, int>{
          'apple': 2,
          'banana': 5,
          'orange': 4,
        };

        final result = map.filter((entry) => entry.value > 3);

        expect(result, {'banana': 5, 'orange': 4});
      });

      test('returns an empty map if no entries match', () {
        final map = <String, int>{
          'apple': 2,
          'banana': 1,
          'orange': 3,
        };

        final result = map.filter((entry) => entry.value > 5);

        expect(result, {});
      });

      test('returns an empty map if original map is empty', () {
        final map = <String, int>{};

        final result = map.filter((entry) => entry.value > 0);

        expect(result, {});
      });
    });

    group('mapKeysAndValues tests', () {
      test('mapKeysAndValues on null', () {
        const Map<String, int>? nullMap = null;
        final result = nullMap.mapKeysAndValues(
          (entry) => MapEntry(entry.key.toUpperCase(), entry.value * 2),
        );
        expect(result, equals({}));
      });

      test('mapKeysAndValues transforms map entries', () {
        final result = nullableMap.mapKeysAndValues(
          (entry) => MapEntry(entry.key.toUpperCase(), entry.value * 2),
        );
        expect(result, equals({'A': 2, 'B': 4}));
      });

      test('returns an empty map when the original map is empty', () {
        final map = <String, int>{};

        final result = map.mapKeysAndValues(
          (entry) => MapEntry(entry.key.length, entry.value * 2),
        );

        expect(result, {});
      });

      test('handles different types for keys and values', () {
        final map = <String, int>{
          'apple': 2,
          'banana': 5,
        };

        final result =
            map.mapKeysAndValues((entry) => MapEntry(entry.value, entry.key));

        expect(result, {2: 'apple', 5: 'banana'});
      });
    });

    test('forEachEntry executes action for each map entry', () {
      final List<String> keys = [];
      nullableMap.forEachEntry((key, value) {
        keys.add(key);
      });
      expect(keys, containsAll(['a', 'b']));
    });

    test('containsKeyOrNull returns true for existing key', () {
      expect(nullableMap.containsKeyOrNull('a'), isTrue);
    });

    test('containsKeyOrNull returns false for non-existing key', () {
      expect(nullableMap.containsKeyOrNull('c'), isFalse);
    });

    test('containsValueOrNull returns true for existing value', () {
      expect(nullableMap.containsValueOrNull(1), isTrue);
    });

    test('containsValueOrNull returns false for non-existing value', () {
      expect(nullableMap.containsValueOrNull(3), isFalse);
    });
  });
}
