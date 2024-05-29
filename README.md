nullx is a Dart toolkit that enhances handling of nullable types, providing utilities for null-checking, navigating nullable structures, and robust error handling, for cleaner and more resilient code.

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
    final resultInt = nullableInt.letNonNull((value) => value * 2);
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
