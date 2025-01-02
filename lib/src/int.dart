/// Extension on `int?` to add utility methods.
///
/// This extension provides two methods:
/// - `orZero`: a getter that returns the integer if it's not null, otherwise
/// it returns zero.
/// - `or`: a method that returns the integer if it's not null, otherwise it
/// returns a default value.
///
/// Example usage:
/// ```dart
/// int? nullableInt = null;
/// print(nullableInt.orZero); // Outputs: 0
/// print(nullableInt.or(defaultValue: 5)); // Outputs: 5
///
/// nullableInt = 10;
/// print(nullableInt.orZero); // Outputs: 10
/// print(nullableInt.or(defaultValue: 5)); // Outputs: 10
/// ```
extension NullableIntExtension on int? {
  /// Returns the integer if it's not null, otherwise it returns zero.
  int get orZero => or();

  /// Returns the integer if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the integer is null.
  /// The default value is zero.
  int or({int defaultValue = 0}) {
    return this ?? defaultValue;
  }

  /// Checks if the integer is positive.
  ///
  /// Returns `true` if the integer is not null and greater than zero, `false`
  /// otherwise.
  bool isPositive() => this != null && this! > 0;

  /// Checks if the integer is negative.
  ///
  /// Returns `true` if the integer is not null and less than zero, `false`
  /// otherwise.
  bool isNegativeValue() => this != null && this! < 0;
}
