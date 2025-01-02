/// Extensions for the [int] class.
extension NullableIntExtension on int? {
  /// Returns the integer if it's not null, otherwise it returns zero.
  ///
  /// Example usage:
  /// ```dart
  /// int? nullableInt = null;
  /// print(nullableInt.orZero); // Outputs: 0
  /// ```
  int get orZero => or();

  /// Returns the integer if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the integer is null.
  /// The default value is zero.
  ///
  /// Example usage:
  /// ```dart
  /// int? nullableInt = null;
  /// print(nullableInt.or(defaultValue: 5)); // Outputs: 5
  /// ```
  int or({int defaultValue = 0}) {
    return this ?? defaultValue;
  }

  /// Checks if the integer is positive.
  ///
  /// Returns `true` if the integer is not null and greater than zero, `false`
  /// otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// int? nullableInt = 10;
  /// print(nullableInt.isPositive()); // Outputs: true
  /// ```
  bool isPositive() => this != null && this! > 0;

  /// Checks if the integer is negative.
  ///
  /// Returns `true` if the integer is not null and less than zero, `false`
  /// otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// int? nullableInt = -10;
  /// print(nullableInt.isNegativeValue()); // Outputs: true
  /// ```
  bool isNegativeValue() => this != null && this! < 0;
}
