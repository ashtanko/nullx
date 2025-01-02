/// Extensions for the [double] class.
extension NullableDoubleExtension on double? {
  /// Returns the double if it's not null, otherwise it returns zero.
  double get orZero => or();

  /// Returns the double if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the double is null.
  /// The default value is zero.
  ///
  /// Example usage:
  /// ```dart
  /// double? nullableDouble = null;
  /// print(nullableDouble.or(defaultValue: 5.5)); // Outputs: 5.5
  /// ```
  double or({double defaultValue = 0}) {
    return this ?? defaultValue;
  }

  /// Checks if the double is positive.
  ///
  /// Returns `true` if the double is not null and greater than zero, `false`
  /// otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// double? nullableDouble = 10.5;
  /// print(nullableDouble.isPositive()); // Outputs: true
  /// ```
  bool isPositive() => this != null && this! > 0.0;

  /// Checks if the double is negative.
  ///
  /// Returns `true` if the double is not null and less than zero, `false`
  /// otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// double? nullableDouble = -10.5;
  /// print(nullableDouble.isNegativeValue()); // Outputs: true
  /// ```
  bool isNegativeValue() => this != null && this! < 0.0;
}
