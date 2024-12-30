<h1 align="center">nullx_map - dart nullability with confidence</h1></br>

<p align="center">
  <a href="https://github.com/ashtanko/nullx/actions/workflows/coverage.yml"><img alt="Coverage" src="https://github.com/ashtanko/nullx/actions/workflows/coverage.yml/badge.svg"/></a>
  <a href="https://github.com/ashtanko/nullx/actions/workflows/build.yml"><img alt="Dart CI" src="https://github.com/ashtanko/nullx/actions/workflows/build.yml/badge.svg"/></a>
  <a href="https://github.com/ashtanko/nullx/actions/workflows/very_good_workflow.yml"><img alt="Very Good Workflow" src="https://github.com/ashtanko/nullx/actions/workflows/very_good_workflow.yml/badge.svg"/></a>
  <a href="https://pub.dev/packages/nullx"><img alt="pub.dev" src="https://img.shields.io/pub/v/nullx?label=nullx"/></a>
  <a href="https://www.codefactor.io/repository/github/ashtanko/nullx"><img alt="CodeFactor" src="https://www.codefactor.io/repository/github/ashtanko/nullx/badge"/></a>
  <a href="https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade"><img alt="Codacy Badge" src="https://app.codacy.com/project/badge/Grade/badee387cb23488c9091051b572c47f1"/></a>
  <a href="https://codecov.io/github/ashtanko/nullx"><img alt="Codecov" src="https://codecov.io/github/ashtanko/nullx/graph/badge.svg?token=D4JQVJUE1M"/></a>
  <a href="https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_coverage"><img alt="Codacy Badge" src="https://app.codacy.com/project/badge/Coverage/badee387cb23488c9091051b572c47f1"/></a>
  <a href="https://github.com/ashtanko/nullx/blob/main/LICENSE"><img alt="License: Apache-2.0" src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/></a>
</p><br>

nullx_map is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_map` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_map: ^latest_version
```

Here is a simple example of how to use nullx_map:

```dart
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
```

## Contributing

Contributions are welcome! Please read the contributing guide to learn how to contribute to the project and set up a development environment.

## License

```plain
Copyright 2024 Oleksii Shtanko

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
