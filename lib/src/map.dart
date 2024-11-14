/// Extension on `Map<K, V>?` providing additional null-aware operations.
///
/// This extension adds methods to `Map` objects that allow for more expressive
/// handling of operations that could involve `null` maps. It includes methods
/// for checking if a map is null or empty, providing default values, and more
/// nuanced manipulations like filtering, updating, and transforming maps safely
extension NullableMapExtensions<K, V> on Map<K, V>? {
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
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Returns the map if it's not null, otherwise returns the provided default
  /// value.
  Map<K, V> orDefault(Map<K, V> defaultValue) => this ?? defaultValue;

  /// Returns the value for the given key if it exists, otherwise returns the
  /// provided default value.
  V getOrElse(K key, V defaultValue) => this?[key] ?? defaultValue;

  /// Puts the default value for the given key if the key is absent in the map.
  void putIfAbsentOrElse(K key, V defaultValue) {
    if (this != null) {
      this!.putIfAbsent(key, () => defaultValue);
    }
  }

  /// Updates the value for the given key using the provided update function.
  void updateValue(K key, V Function(V?) update) {
    if (this != null) {
      this![key] = update(this![key]);
    }
  }

  /// Returns a new map containing the entries that satisfy the provided test.
  Map<K, V> filter(bool Function(MapEntry<K, V>) test) {
    if (this == null) return {};
    return Map<K, V>.fromEntries(this!.entries.where(test));
  }

  /// Maps the keys and values of the map using the provided convert function
  /// and returns a new map.
  Map<RK, RV> mapKeysAndValues<RK, RV>(
    MapEntry<RK, RV> Function(MapEntry<K, V>) convert,
  ) {
    if (this == null) return {};
    return Map<RK, RV>.fromEntries(this!.entries.map(convert));
  }

  /// Performs an action for each key-value pair in the map.
  void forEachEntry(void Function(K key, V value) action) {
    if (this != null) {
      this!.forEach(action);
    }
  }

  /// Checks if a key exists in the map, safely handling null maps.
  bool containsKeyOrNull(K key) => this?.containsKey(key) ?? false;

  /// Checks if a value exists in the map, safely handling null maps.
  bool containsValueOrNull(V value) => this?.containsValue(value) ?? false;

  /// Returns the length of the map if it's not null, otherwise returns 0.
  int safeLength() => this?.length ?? 0;
}
