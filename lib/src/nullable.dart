import 'package:nullx/nullx.dart';

/// Extension on `T?`.
extension NullableExtension<T> on T? {
  /// Returns the value if it is not null, otherwise returns the value supplied
  /// by the [supplier] function.
  ///
  /// [supplier] is a function that provides a default value when the original
  /// value is null.
  T orElseGet(T Function() supplier) {
    return this ?? supplier();
  }

  /// Extension on `T?` to add an `unwrapped` method.
  ///
  /// This extension provides a convenient way to handle nullable types.
  /// The `unwrapped` method takes a function that is applied to the non-null
  /// value.
  ///
  /// The function should take a non-null `T`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nullableInt = 1;
  /// nullableInt.unwrapped((item) => print(item)); // prints: 1
  /// ```
  void unwrapped(VoidClosure value) {
    if (this != null) {
      value(this as T);
    }
  }

  /// Returns the value if it is not null, otherwise throws an exception with
  /// the provided [message].
  ///
  /// [message] is the custom error message for the exception.
  T orThrow(String message) {
    if (this == null) {
      throw Exception(message);
    }
    return this!;
  }
}
