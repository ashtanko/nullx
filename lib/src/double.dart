/// Extension on `double?` to add utility methods.
///
/// This extension provides two methods:
/// - `orZero`: a getter that returns the double if it's not null, otherwise it
/// returns zero.
/// - `or`: a method that returns the double if it's not null, otherwise it
/// returns a default value.
///
/// Example usage:
/// ```dart
/// double? nullableDouble = null;
/// print(nullableDouble.orZero); // Outputs: 0.0
/// print(nullableDouble.or(defaultValue: 5.5)); // Outputs: 5.5
///
/// nullableDouble = 10.5;
/// print(nullableDouble.orZero); // Outputs: 10.5
/// print(nullableDouble.or(defaultValue: 5.5)); // Outputs: 10.5
/// ```
extension NullableDoubleExtension on double? {
  /// Returns the double if it's not null, otherwise it returns zero.
  double get orZero => or();

  /// Returns the double if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the double is null.
  /// The default value is zero.
  double or({double defaultValue = 0}) {
    return this ?? defaultValue;
  }

  /// Checks if the double is positive.
  ///
  /// Returns `true` if the double is not null and greater than zero, `false`
  /// otherwise.
  bool isPositive() => this != null && this! > 0.0;

  /// Checks if the double is negative.
  ///
  /// Returns `true` if the double is not null and less than zero, `false`
  /// otherwise.
  bool isNegativeValue() => this != null && this! < 0.0;
}
