nullx is a Dart toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

[![Coverage](https://github.com/ashtanko/nullx/actions/workflows/coverage.yml/badge.svg)](https://github.com/ashtanko/nullx/actions/workflows/coverage.yml)
[![Dart CI](https://github.com/ashtanko/nullx/actions/workflows/build.yml/badge.svg)](https://github.com/ashtanko/nullx/actions/workflows/build.yml)

[![nullx](https://img.shields.io/pub/v/nullx?label=nullx)](https://pub.dev/packages/nullx)

[![CodeFactor](https://www.codefactor.io/repository/github/ashtanko/nullx/badge)](https://www.codefactor.io/repository/github/ashtanko/nullx)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/badee387cb23488c9091051b572c47f1)](https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![codecov](https://codecov.io/github/ashtanko/nullx/graph/badge.svg?token=D4JQVJUE1M)](https://codecov.io/github/ashtanko/nullx)
[![Codacy Badge](https://app.codacy.com/project/badge/Coverage/badee387cb23488c9091051b572c47f1)](https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_coverage)

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Offers robust error handling

## Getting started 🎉

To use this package, add `nullx` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx: ^latest_version
```

Here is a simple example of how to use nullx:

### Collections

```dart
import 'package:nullx/nullx.dart';

void main() {
  final list = [1, null, 3, null];
  list.mapNonNull((item) => item * 2); // prints: [2, 6]
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  final list = [1, null, 3, null];
  list.mapNonNullIndexed((item, index) => item * index); // prints: [0, 6]
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  final List<int>? nullableList = [1, 2, 3];
  nullableList.whatIfNotNullOrEmpty(
    (list) => print(list), // whatIf
    () => print('List is null or empty'), // whatIfNot
  );
  // prints: [1, 2, 3]
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  List<int>? nullableList = [1, 2, 3];
  print(nullableList.isNullOrEmpty); // prints: false

  nullableList = null;
  print(nullableList.isNullOrEmpty); // prints: true

  nullableList = [];
  print(nullableList.isNullOrEmpty); // prints: true
}
```

### Types

```dart
import 'package:nullx/nullx.dart';

void main() {
  const String? nullableString = 'example';
  unwrapped(nullableString, (value) {});

  final List<String?> strings = [null, 'one', null, 'two', null];
  strings.map((s) => s.letNonNull((s) => s.length)).whereType<int>().toList();
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
    const int? nullableInt = 10;
    final resultInt = nullableInt.letNonNull((value) => value * 2); // prints: 2
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  const int userAge = 20;
  executeIf(
    () => userAge >= 18,
    onConditionMet: () {
      // prints 'You are an adult.'
    },
    onConditionNotMet: () {
      // prints 'You are not an adult.'
    },
  );
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  var userAge = 20;
  final result = executeIfAs<String>(
    () => userAge >= 18,
    onConditionMet: () => 'You are an adult.',
    onConditionNotMet: () => 'You are not an adult.',
  );
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
    void printValue(String value) {
      // prints 'The value is: $value'
    }

    notEmpty(nullableString, printValue);
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
    const String? nullableString = 'example';
    unwrapped(nullableString, (value) {}); // prints: 'example'
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
    var nullableString = 'Hello';
    nullableString.notEmpty((item) => print(item)); // prints: Hello
}
```

```dart
import 'package:nullx/nullx.dart';

void main() {
  const int userAge = 20;
  // Unwraps the nullable string and performs an operation on it
  callWhen(
    condition: () => userAge >= 18,
    onMet: () {
      // prints 'You are an adult.'
    },
    onNotMet: () {
      // prints 'You are not an adult.'
    },
  );
}

```

```dart
import 'package:nullx/nullx.dart';

void main() {
    const int? nullableInt = null;
    nullableInt.orZero; // Outputs: 0
    nullableInt.or(defaultValue: 5); // Outputs: 5

    const double? nullableDouble = null;
    nullableDouble.orZero; // Outputs: 0.0
    nullableDouble.or(defaultValue: 5.5); // Outputs: 5.5

    const bool? nullableBool = null;
    nullableBool.orFalse; // Outputs: false
    nullableBool.or(defaultValue: true); // Outputs: true
}
```

```dart
void main() {
    final Map<String, int>? nullableMap = {'a': 1, 'b': 2};
    print(nullableMap.isNullOrEmpty); // false
    print(nullableMap.getOrElse('c', 0)); // 0
    nullableMap.putIfAbsentOrElse('c', 3); // {a: 1, b: 2, c: 3}
    nullableMap.updateValue('a', (value) => value! + 10); // {a: 11, b: 2, c: 3}
    final filteredMap = nullableMap.filter((entry) => entry.value > 2);
    print(filteredMap); // {a: 11, c: 3}
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
