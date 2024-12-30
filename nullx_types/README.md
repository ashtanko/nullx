<h1 align="center">nullx_types - dart nullability with confidence</h1></br>

<p align="center">
  <a href="https://github.com/ashtanko/nullx/actions/workflows/coverage.yml"><img alt="Coverage" src="https://github.com/ashtanko/nullx/actions/workflows/coverage.yml/badge.svg"/></a>
  <a href="https://github.com/ashtanko/nullx/actions/workflows/build.yml"><img alt="Dart CI" src="https://github.com/ashtanko/nullx/actions/workflows/build.yml/badge.svg"/></a>
  <a href="https://github.com/ashtanko/nullx/actions/workflows/very_good_workflow.yml"><img alt="Very Good Workflow" src="https://github.com/ashtanko/nullx/actions/workflows/very_good_workflow.yml/badge.svg"/></a>
  <a href="https://pub.dev/packages/nullx"><img alt="pub.dev" src="https://img.shields.io/pub/v/nullx?label=nullx"/></a>
  <a href="https://www.codefactor.io/repository/github/ashtanko/nullx"><img alt="CodeFactor" src="https://www.codefactor.io/repository/github/ashtanko/nullx/badge"/></a>
  <a href="https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade"><img alt="Codacy Badge" src="https://app.codacy.com/project/badge/Grade/badee387cb23488c9091051b572c47f1"/></a>
  <a href="https://codecov.io/github/ashtanko/nullx"><img alt="Codecov" src="https://codecov.io/github/ashtanko/nullx/graph/badge.svg?token=D4JQVJUE1M"/></a>
  <a href="https://app.codacy.com/gh/ashtanko/nullx/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_coverage"><img alt="Codacy Badge" src="https://app.codacy.com/project/badge/Coverage/badee387cb23488c9091051b572c47f1"/></a>
  <a href="https://github.com/ashtanko/the-algorithms/blob/main/LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg"/></a>
</p><br>

nullx_types is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_types` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_types: ^latest_version
```

Here is a simple example of how to use nullx_types:

```dart
import 'package:nullx_types/nullx_types.dart';

void main() async {
  /// Variables
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<String?>? nullableStringList = [null, 'one', null, 'two', null];
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const int? nullableInt = 10;
  const nonNullInt = 1;
  const int? nullInt = null;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const String? nullableString = 'example';
  const String emptyString = '';
  const String? nullString = null;
  const double? nullDouble = null;
  const bool? nullBool = null;

  /// Collections
  // A list of nullable strings
  final List<String?> strs = [null, 'one', null, 'two', null];

  // Filters out null elements from the list and converts the remaining elements to non-null
  strs.where((element) => element != null).map((e) => e!).toList();
  const int userAge = 20;
  // prints: 'You are an adult.'

  const double? nullableDouble = null;
  nullableDouble.orZero; // Outputs: 0.0
  nullableDouble.or(defaultValue: 5.5); // Outputs: 5.5

  const bool? nullableBool = null;
  nullableBool.orFalse; // Outputs: false
  nullableBool.or(defaultValue: true); // Outputs: true

  // Unwraps the nullable string and performs an operation on it
  final res1 = executeIfAs<String>(
    () => userAge >= 18,
    ifTrue: () => 'You are an adult.',
    ifFalse: () => 'You are not an adult.',
  );

  // ignore: avoid_print
  print(res1); // prints: 'You are an adult.'

  // Unwraps the nullable string and performs an operation on it
  nullableString.unwrapped((value) {}); // prints: 'example'

  // Unwraps the nullable string and performs an operation on it
  // ignore: avoid_print
  nullableString.notEmpty((s) => print(s)); // prints: 'The value is: example'

  // Unwraps the nullable string and performs an operation on it
  final result = nullableInt.notNullWith<int>(
    isTrue: (item) => item * 2,
    isFalse: () => 0,
  );
  // ignore: avoid_print
  print(result); // prints: 20

  final res2 = nullableInt.conditionNotNullAs<int>(
    condition: (value) => value > 5,
    isTrue: (value) => value * 2,
    isFalse: () => -1,
  );

  // ignore: avoid_print
  print(res2); // prints: 20

  // Unwraps the nullable string and performs an operation on it
  const num = 10;
  final res3 = num.takeIf((value) => value > 5);
  // ignore: avoid_print
  print('takeIf: $res3'); // prints: 10

  final res4 = num.takeUnless((value) => value > 5);
  // ignore: avoid_print
  print('takeUnless: $res4'); // prints: 10

  // Unwraps the nullable string and performs an operation on it
  final res5 = nullableInt.let((item) => item * 2);
  // ignore: avoid_print
  print('let: $res5'); // prints: 20

  // Unwraps the nullable string and performs an operation on it
  final res6 = nonNullInt.run((item) => item * 2);
  // ignore: avoid_print
  print('run: $res6'); // prints: 2

  var str = 'Hello';
  str.also((item) => str = item.toUpperCase());
  // ignore: avoid_print
  print('also: $str'); // prints: HELLO

  // Maps over the list, applying a function to each non-null element,
  // then filters out null results and converts the result to a list
  nullableStringList
      ?.map((s) => s.letNonNull((s) => s.length))
      .whereType<int>()
      .toList();

  // ignore: avoid_print
  print('call isNullOrEmpty on null string: ${nullableString.isNullOrEmpty}');

  // ignore: avoid_print
  print('call isNullOrEmpty on empty string: ${emptyString.isNullOrEmpty}');

  final res8 = nullString.orDefault('hi');
  // ignore: avoid_print
  print('orDefault: $res8'); // prints: 'hi'

  // Unwraps the nullable int
  nullInt.orZero; // Outputs: 0
  nullInt.or(defaultValue: 5); // Outputs: 5

  // Unwraps the nullable double
  nullDouble.orZero; // Outputs: 0.0
  nullDouble.or(defaultValue: 5.5); // Outputs: 5.5

  // Unwraps the nullable bool
  nullBool.orFalse; // Outputs: false
  nullBool.or(defaultValue: true); // Outputs: true
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
