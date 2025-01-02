import 'package:nullx/nullx.dart';

/// Extensions for the [String] class.
extension NullableStringExtension on String? {
  /// Checks if the string is null or empty.
  ///
  /// Returns `true` if the string is null or an empty string, `false`
  /// otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// String? nullableString = 'Hello';
  /// print(nullableString.isNullOrEmpty); // prints: false
  /// ```
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Checks if the string is not null or empty.
  ///
  /// Returns `true` if the string is not null or an empty string, `false`
  /// otherwise.
  bool get hasValue => !isNullOrEmpty;

  /// Returns the string if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the string is null.
  String orDefault(String defaultValue) => this ?? defaultValue;

  /// Extension on `T?` where `T` extends `String` to add a `notEmpty` method.
  ///
  /// This extension provides a convenient way to handle nullable strings.
  /// The `notEmpty` method takes a function that is applied to the non-null and
  /// non-empty string.
  ///
  /// The function should take a non-null `T`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nullableString = 'Hello';
  /// nullableString.notEmpty((item) => print(item)); // prints: Hello
  /// ```
  void notEmpty(VoidClosure value) {
    if (this != null && this!.isNotEmpty) {
      value(this);
    }
  }
}
