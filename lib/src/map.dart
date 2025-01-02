/// Extension on `Map<K, V>?` providing additional null-aware operations.
///
/// This extension adds methods to `Map` objects that allow for more expressive
/// handling of operations that could involve `null` maps. It includes methods
/// for checking if a map is null or empty, providing default values, and more
/// nuanced manipulations like filtering, updating, and transforming maps safely
extension NullableMapExtension<K, V> on Map<K, V>? {
  /// Checks if the map is null or empty.
  /// Returns true if the map is null or empty, otherwise returns false.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, int>? nullableMap = {'a': 1, 'b': 2};
  /// print(nullableMap.isNullOrEmpty); // prints: false
  /// ```
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Checks if the map is not null and not empty.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(map.isNotNullOrEmpty); // true
  ///
  /// map = null;
  /// print(map.isNotNullOrEmpty); // false
  /// ```
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Returns the map if it's not null, otherwise returns the provided default value.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = null;
  /// print(map.orDefault({'defaultKey': 42})); // {'defaultKey': 42}
  ///
  /// map = {'a': 1};
  /// print(map.orDefault({'defaultKey': 42})); // {'a': 1}
  /// ```
  Map<K, V> orDefault(Map<K, V> defaultValue) => this ?? defaultValue;

  /// Returns the value for the given key if it exists, otherwise returns the
  /// provided default value.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(map.getOrElse('a', 42)); // 1
  /// print(map.getOrElse('c', 42)); // 42
  ///
  /// map = null;
  /// print(map.getOrElse('a', 42)); // 42
  /// ```
  V getOrElse(K key, V defaultValue) => this?[key] ?? defaultValue;

  /// Puts the default value for the given key if the key is absent in the map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1};
  /// map.putIfAbsentOrElse('b', 42);
  /// print(map); // {'a': 1, 'b': 42}
  ///
  /// map = null;
  /// map.putIfAbsentOrElse('c', 100); // No effect
  /// ```
  void putIfAbsentOrElse(K key, V defaultValue) {
    if (this != null) {
      this!.putIfAbsent(key, () => defaultValue);
    }
  }

  /// Updates the value for the given key using the provided update function.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1};
  /// map.updateValue('a', (value) => (value ?? 0) + 5);
  /// print(map); // {'a': 6}
  ///
  /// map.updateValue('b', (value) => 10);
  /// print(map); // {'a': 6, 'b': 10}
  ///
  /// map = null;
  /// map.updateValue('c', (value) => 42); // No effect
  /// ```
  void updateValue(K key, V Function(V?) update) {
    if (this != null) {
      this![key] = update(this![key]);
    }
  }

  /// Returns a new map containing the entries that satisfy the provided test.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2, 'c': 3};
  /// print(map.filter((entry) => entry.value > 1)); // {'b': 2, 'c': 3}
  ///
  /// map = null;
  /// print(map.filter((entry) => entry.value > 1)); // {}
  /// ```
  Map<K, V> filter(bool Function(MapEntry<K, V>) test) {
    if (this == null) return {};
    return Map<K, V>.fromEntries(this!.entries.where(test));
  }

  /// Maps the keys and values of the map using the provided convert function
  /// and returns a new map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(
  ///   map.mapKeysAndValues((entry) =>
  ///     MapEntry(entry.key.toUpperCase(), entry.value * 2))
  /// );
  /// // {'A': 2, 'B': 4}
  ///
  /// map = null;
  /// print(
  ///     map.mapKeysAndValues((entry) => MapEntry(entry.key, entry.value))
  ///   ); // {}
  /// ```
  Map<RK, RV> mapKeysAndValues<RK, RV>(
    MapEntry<RK, RV> Function(MapEntry<K, V>) convert,
  ) {
    if (this == null) return {};
    return Map<RK, RV>.fromEntries(this!.entries.map(convert));
  }

  /// Performs an action for each key-value pair in the map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// map.forEachEntry((key, value) {
  ///   print('$key: $value');
  /// });
  /// // Output:
  /// // a: 1
  /// // b: 2
  ///
  /// map = null;
  /// map.forEachEntry((key, value) => print('$key: $value')); // No output
  /// ```
  void forEachEntry(void Function(K key, V value) action) {
    if (this != null) {
      this!.forEach(action);
    }
  }

  /// Checks if a key exists in the map, safely handling null maps.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(map.containsKeyOrNull('a')); // true
  /// print(map.containsKeyOrNull('c')); // false
  ///
  /// map = null;
  /// print(map.containsKeyOrNull('a')); // false
  /// ```
  bool containsKeyOrNull(K key) => this?.containsKey(key) ?? false;

  /// Checks if a value exists in the map, safely handling null maps.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(map.containsValueOrNull(2)); // true
  /// print(map.containsValueOrNull(3)); // false
  ///
  /// map = null;
  /// print(map.containsValueOrNull(1)); // false
  /// ```
  bool containsValueOrNull(V value) => this?.containsValue(value) ?? false;

  /// Returns the length of the map if it's not null, otherwise returns 0.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int>? map = {'a': 1, 'b': 2};
  /// print(map.safeLength()); // 2
  ///
  /// map = null;
  /// print(map.safeLength()); // 0
  /// ```
  int safeLength() => this?.length ?? 0;
}
