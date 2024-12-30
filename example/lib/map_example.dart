import 'package:nullx_map/nullx_map.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Map<String, int>? nullableMap = {'a': 1, 'b': 2};

  // Check if the map is null or empty
  // ignore: avoid_print
  print(nullableMap.isNullOrEmpty); // false

  // Get value for key or return default
  // ignore: avoid_print
  print(nullableMap.getOrElse('c', 0)); // 0

  // Put a value if the key is absent
  nullableMap.putIfAbsentOrElse('c', 3);
  // ignore: avoid_print
  print(nullableMap); // {a: 1, b: 2, c: 3}

  // Update a value using a function
  nullableMap.updateValue('a', (value) => value! + 10);
  // ignore: avoid_print
  print(nullableMap); // {a: 11, b: 2, c: 3}
  // ignore: avoid_print

  // Filter the map
  final filteredMap = nullableMap.filter((entry) => entry.value > 2);
  // ignore: avoid_print
  print(filteredMap); // {a: 11, c: 3}

  // Map keys and values
  final mappedMap = nullableMap.mapKeysAndValues(
    (entry) => MapEntry(entry.key.toUpperCase(), entry.value.toString()),
  );
  // ignore: avoid_print
  print(mappedMap); // {A: 11, B: 2, C: 3}

  // Iterate through the map
  // ignore: avoid_print
  nullableMap.forEachEntry((key, value) => print('$key: $value'));
  // Output:
  // a: 11
  // b: 2
  // c: 3

  // Check if the map contains a key or value
  // ignore: avoid_print
  print(nullableMap.containsKeyOrNull('a')); // true
  // ignore: avoid_print
  print(nullableMap.containsValueOrNull(4)); // false
}
