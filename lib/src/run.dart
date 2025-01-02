import 'package:nullx/nullx.dart';

/// Extensions for the `run` method.
extension RunExtension<T extends Object> on T {
  /// Extension on `T` where `T` extends `Object` to add a `run` method.
  ///
  /// This extension provides a convenient way to apply a transformation to a
  /// non-null value. The `run` method takes a closure and applies it to the
  /// value.
  ///
  /// The closure should take a non-null `T` and return a nullable `R`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nonNullInt = 1;
  /// var result = nonNullInt.run((item) => item * 2);
  /// print(result); // prints: 2
  /// ```
  @pragma('vm:prefer-inline')
  R? run<R>(Closure<R?, T> closure) {
    return closure(this);
  }
}
