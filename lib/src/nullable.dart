import 'package:nullx/nullx.dart';

/// Extensions for the [T] class.
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
  ///
  /// Example usage:
  /// ``` dart
  /// var nullableInt = 1;
  /// print(nullableInt.orThrow('Value is null')); // Outputs: 1
  /// ```
  T orThrow([String message = 'Value cannot be null']) {
    if (this == null) {
      throw Exception(message);
    }
    return this!;
  }

  /// Maps the value to another value if it's not null.
  /// Returns null if the value is null.
  ///
  /// [mapper] is a function that takes the non-null value and returns a new
  /// value.
  ///
  /// Example usage:
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.map((item) => item * 2);
  /// print(result); // prints: 2
  /// ```
  R? mapNullable<R>(R Function(T value) mapper) =>
      this != null ? mapper(this as T) : null;
}
