/// Extension on `bool?` to add utility methods.
///
/// This extension provides two methods:
/// - `orFalse`: a getter that returns the boolean if it's not null, otherwise
/// it returns false.
/// - `or`: a method that returns the boolean if it's not null, otherwise it
/// returns a default value.
///
/// Example usage:
/// ```dart
/// bool? nullableBool = null;
/// print(nullableBool.orFalse); // Outputs: false
/// print(nullableBool.or(defaultValue: true)); // Outputs: true
///
/// nullableBool = true;
/// print(nullableBool.orFalse); // Outputs: true
/// print(nullableBool.or(defaultValue: false)); // Outputs: true
/// ```
extension NullableBoolExtension on bool? {
  /// Returns the boolean if it's not null, otherwise it returns false.
  bool get orFalse => or();

  /// Returns the boolean if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the boolean is null.
  /// The default value is false.
  bool or({bool defaultValue = false}) {
    return this ?? defaultValue;
  }
}
