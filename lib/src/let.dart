/// Extension on `T?` to add a `let` method.
extension LetExtension<T, R> on T? {
  /// Applies the [block] function to this value and returns the result if this
  /// value is not null.
  ///
  /// This function is useful when you need to perform a transformation on a
  /// nullable value.
  /// The [block] function should accept a single argument of type [T], which
  /// represents the non-null value,
  /// and return a value of type [R].
  ///
  /// If this value is null, the `let` method returns null.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.let((item) => item * 2);
  /// print(result); // prints: 2
  /// ```
  ///
  /// @param block the function to apply on the value
  /// @return the result of the [block] function if this value is not null,
  /// otherwise null
  @pragma('vm:prefer-inline')
  R? let(R Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    return null;
  }

  /// Applies the [block] function to this value and returns the result if this
  /// value is not null.
  ///
  /// This function is useful when you need to perform a transformation on a
  /// nullable value. The [block] function should accept a single argument of
  /// type [T], which represents the non-null value, and return a value of type
  /// [R].
  ///
  /// If this value is null, the `letNonNull` method returns null.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.letNonNull((item) => item * 2);
  /// print(result); // prints: 2
  /// ```
  ///
  /// @param block the function to apply on the value
  /// @return the result of the [block] function if this value is not null,
  /// otherwise null
  @pragma('vm:prefer-inline')
  R? letNonNull(R? Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    return null;
  }
}
