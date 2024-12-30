<h1 align="center">nullx_runes - dart nullability with confidence</h1></br>

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

nullx_runes is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_runes` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_runes: ^latest_version
```

Here is a simple example of how to use nullx_runes:

```dart
import 'package:nullx_runes/nullx_runes.dart';

void main() {
  // Example usage of NullableRunesExtensions

  Runes? runes1;
  Runes? runes2 = Runes('hello');
  Runes? runes3 = Runes('');

  // orEmpty()
  print(runes1.orEmpty()); // Output: ""
  print(runes2.orEmpty()); // Output: hello
  print(runes3.orEmpty()); // Output: ""

  // isNullOrEmpty()
  print(runes1.isNullOrEmpty()); // Output: true
  print(runes2.isNullOrEmpty()); // Output: false
  print(runes3.isNullOrEmpty()); // Output: true

  // hasValue()
  print(runes1.hasValue()); // Output: false
  print(runes2.hasValue()); // Output: true
  print(runes3.hasValue()); // Output: false

  // map()
  List<String> mappedRunes = runes2.map((rune) => String.fromCharCode(rune)).toList();
  print(mappedRunes); // Output: [h, e, l, l, o]

  // joinAsString()
  String joinedRunes = runes2.joinAsString('-');
  print(joinedRunes); // Output: h-e-l-l-o

  // firstOrNull()
  print(runes1.firstOrNull()); // Output: null
  print(runes2.firstOrNull()); // Output: 104 (ASCII code for 'h')
  print(runes3.firstOrNull()); // Output: null

  // lastOrNull()
  print(runes1.lastOrNull()); // Output: null
  print(runes2.lastOrNull()); // Output: 111 (ASCII code for 'o')
  print(runes3.lastOrNull()); // Output: null
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
