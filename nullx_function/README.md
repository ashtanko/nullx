<h1 align="center">nullx_function - dart nullability with confidence</h1></br>

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

nullx_function is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_function` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_function: ^latest_version
```

Here is a simple example of how to use nullx_function:

```dart
import 'package:nullx_function/nullx_function.dart';

void main() async {
  // Example 1: callIfNotNull
  void greet(String name) {
    // ignore: avoid_print
    print('Hello, $name!');
  }

  Function? nullableFunction = greet;
  // ignore: avoid_print
  print('Example 1: callIfNotNull');
  nullableFunction.callIfNotNull(['Alice']); // Output: Hello, Alice!

  nullableFunction = null;
  nullableFunction.callIfNotNull(['Bob']); // No output

  // ignore: avoid_print
  print('\nExample 2: callWithOneArg');
  // Example 2: callWithOneArg
  void printMessage(String message) {
    // ignore: avoid_print
    print('Message: $message');
  }

  nullableFunction = printMessage;
  nullableFunction
      .callWithOneArg('This is a test.'); // Output: Message: This is a test.

  nullableFunction = null;
  nullableFunction.callWithOneArg('This won’t be printed.'); // No output

  // ignore: avoid_print
  print('\nExample 3: callOrDefault');
  // Example 3: callOrDefault
  int doubleValue(int value) => value * 2;

  nullableFunction = doubleValue;
  int? result = nullableFunction.callOrDefault<int>([5], -1); // Returns: 10
  // ignore: avoid_print
  print('Double value of 5: $result');

  nullableFunction = null;
  result = nullableFunction.callOrDefault<int>([5], -1); // Returns: -1
  // ignore: avoid_print
  print('Default value: $result');

  // ignore: avoid_print
  print('\nExample 4: callAndReturn');
  // Example 4: callAndReturn
  String concatenate({required String a, required String b}) => '$a$b';

  nullableFunction = concatenate;
  String? concatenated = nullableFunction.callAndReturn<String>([], {
    #a: 'Hello, ',
    #b: 'World!',
  }); // Returns: Hello, World!
  // ignore: avoid_print
  print('Concatenated result: $concatenated');

  nullableFunction = null;
  concatenated = nullableFunction.callAndReturn<String>([], {
    #a: 'This ',
    #b: 'won’t be concatenated.',
  }); // Returns: null
  // ignore: avoid_print
  print('Concatenated result when function is null: $concatenated');
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
