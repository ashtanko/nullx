import 'package:nullx/nullx.dart';

/// Extension on `T` to add an `also` method.
extension AlsoExtension<T extends Object?> on T {
  /// Extension on `T` to add an `also` method.
  ///
  /// This extension provides a convenient way to perform an action on a value
  /// and return the same value. The `also` method takes a closure and applies
  /// it to the value.
  ///
  /// The closure should take a `T` and return `void`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 1;
  /// var result = value.also((item) => print(item)); // prints: 1
  /// print(result); // prints: 1
  /// ```
  @pragma('vm:prefer-inline')
  T also(Closure<void, T> closure) {
    closure(this);

    return this;
  }
}
