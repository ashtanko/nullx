<h1 align="center">nullx_stream - dart nullability with confidence</h1></br>

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

nullx_stream is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_stream` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_stream: ^latest_version
```

Here is a simple example of how to use nullx_stream:

```dart
import 'package:nullx_stream/nullx_stream.dart';

void main() async {
  // Example 1: orDefault
  Stream<int>? stream1;
  Stream<int> streamWithDefault = stream1.orDefault(0);
  streamWithDefault.listen(print); // Output: 0

  // Example 2: mapIfNotNull
  Stream<int>? stream2 = Stream.fromIterable([1, 2, 3]);
  Stream<String>? mappedStream = stream2.mapIfNotNull((value) => 'Value: $value');
  mappedStream?.listen(print); // Output: Value: 1, Value: 2, Value: 3

  // Example 3: combineStreams
  Stream<int>? stream3 = Stream.fromIterable([1, 2]);
  Stream<int>? stream4 = Stream.fromIterable([3, 4]);
  Stream<int>? stream5 = null;
  Stream<List<int>> combinedStream =
      NullableStreamExtensions.combineStreams([stream3, stream4, stream5]);
  combinedStream.listen(print); // Output: [1, 3], [2, 4]

  // Example 4: firstOrDefault
  Stream<int>? stream6 = Stream.fromIterable([1, 2, 3]);
  int firstValue = await stream6.firstOrDefault(0);
  print(firstValue); // Output: 1

  // Example 5: mergeWith
  Stream<int>? stream7 = Stream.fromIterable([1, 2]);
  Stream<int>? stream8 = Stream.fromIterable([3, 4]);
  Stream<int> mergedStream = stream7.mergeWith(stream8!);
  mergedStream.listen(print); // Output: 1, 2, 3, 4

  // Example 6: handleNull
  Stream<int>? stream9;
  stream9.handleNull(() => print('Stream is null')); // Output: Stream is null

  // Example 7: filterIfNotNull
  Stream<int>? stream10 = Stream.fromIterable([1, 2, 3, 4, 5]);
  Stream<int>? filteredStream = stream10.filterIfNotNull((value) => value > 2);
  filteredStream?.listen(print); // Output: 3, 4, 5
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
