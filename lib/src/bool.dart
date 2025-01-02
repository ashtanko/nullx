/// Extensions for the [bool] class.
extension NullableBoolExtension on bool? {
  /// Returns the boolean if it's not null, otherwise it returns false.
  ///
  /// This is a shorthand for `or(defaultValue: false)`.
  ///
  /// Example usage:
  /// ```dart
  /// bool? nullableBool = null;
  /// print(nullableBool.orFalse); // Outputs: false
  /// ```
  bool get orFalse => or();

  /// Returns the boolean if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the boolean is null.
  /// The default value is false.
  ///
  /// Example usage:
  /// ```dart
  /// bool? nullableBool = null;
  /// print(nullableBool.or(defaultValue: true)); // Outputs: true
  /// ```
  bool or({bool defaultValue = false}) {
    return this ?? defaultValue;
  }
}
