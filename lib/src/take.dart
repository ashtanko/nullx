/// Extensions for the [T] class.
extension TakeIfExtension<T> on T {
  /// Evaluates the given [predicate] function on the value of type [T] and
  /// returns the value if the [predicate] is true, otherwise returns null.
  ///
  /// This function is useful when you need to conditionally return the value
  /// based on a certain condition.
  ///
  /// The [predicate] function should accept a single argument of type [T],
  /// which represents the value, and return a boolean.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 5;
  /// print(value.takeIf((item) => item > 3)); // prints: 5
  /// ```
  ///
  /// @param predicate the function to test on the value
  /// @return the value if the [predicate] is true, otherwise null
  @pragma('vm:prefer-inline')
  T? takeIf(bool Function(T) predicate) {
    return predicate(this) ? this : null;
  }

  /// Evaluates the given [predicate] function on the value of type [T] and
  /// returns the value if the [predicate] is false, otherwise returns null.
  ///
  /// This function is useful when you need to conditionally return the value
  /// based on a certain condition.
  ///
  /// The [predicate] function should accept a single argument of type [T],
  /// which represents the value, and return a boolean.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 5;
  /// print(value.takeUnless((item) => item > 3)); // prints: null
  /// ```
  ///
  /// @param predicate the function to test on the value
  /// @return the value if the [predicate] is false, otherwise null
  @pragma('vm:prefer-inline')
  T? takeUnless(bool Function(T) predicate) {
    return !predicate(this) ? this : null;
  }
}
