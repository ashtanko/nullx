<h1 align="center">nullx_future - dart nullability with confidence</h1></br>

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

nullx_future is a **dart** toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

## Features

- Provides utilities for null-checking
- Helps in navigating nullable structures
- Nullable types extensions

## Getting started 🎉

To use this package, add `nullx_future` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  nullx_future: ^latest_version
```

Here is a simple example of how to use nullx_future:

```dart
import 'package:nullx_future/nullx_future.dart';

void main() async {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFuture = Future.value(42);
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? failedFuture = Future.error(Exception('Failed'));

  // Return a default value if the Future completes with null
  final int result2 = await nullableFuture.orDefault(5);
  // ignore: avoid_print
  print(result2); // 42

  // Return null if the Future completes with an error
  final int? errorHandled = await failedFuture.onErrorReturnNull();
  // ignore: avoid_print
  print(errorHandled); // null

  // Return a default value if the Future completes with an error
  final int? errorHandledWithValue = await failedFuture.onErrorReturn(5);
  // ignore: avoid_print
  print(errorHandledWithValue); // 5

  // Provide an alternative Future if the original completes with null
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFutureWithNull = Future.value();
  final int alternative = await nullableFutureWithNull.orElse(() async => 99);
  // ignore: avoid_print
  print(alternative); // 99

  // Execute an action when the Future completes
  // ignore: avoid_print
  await nullableFuture.whenComplete(() => print('Completed')); // Completed

  // Ignore any errors the Future may throw
  await failedFuture.ignoreErrors(); // No output, error ignored

  // Timeout a Future and return null if it doesn't complete in time
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? slowFuture =
      Future.delayed(const Duration(seconds: 2), () => 10);
  final int? timedOut =
      await slowFuture.timeoutWithNull(const Duration(seconds: 1));
  // ignore: avoid_print
  print(timedOut); // null

  // Chain another Future using thenOrNull
  final Future<String?> chained =
      nullableFuture.thenOrNull((value) => Future.value('Value: $value'));
  // ignore: avoid_print
  print(await chained); // Value: 42

  // Catch an error and return null using catchErrorOrNull
  final int? caughtError = await failedFuture.catchErrorOrNull((error) {
    // ignore: avoid_print
    print('Caught error: $error');
  });
  // ignore: avoid_print
  print(caughtError); // Caught error: Exception: Failed, null
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
