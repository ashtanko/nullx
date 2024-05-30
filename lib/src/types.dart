/// Calls the provided [value] function if the [nullableValue] is not null.
///
/// This function is useful for ensuring that an action is performed only when the [nullableValue]
/// contains a non-null value.
///
/// Example:
/// ```dart
/// void printValue(int value) {
///   print('The value is: $value');
/// }
///
/// void main() {
///   int? nullableInt = 42;
///   unwrapped(nullableInt, printValue); // This will print "The value is: 42"
/// }
/// ```
///
/// The provided [value] function should accept a single argument of type [T], which represents
/// the non-null value of [nullableValue].
///
/// Generic type [T] can be inferred automatically based on the type of the provided [nullableValue].
void unwrapped<T>(T? nullableValue, void Function(T) value) {
  if (nullableValue != null) {
    value(nullableValue);
  }
}

/// Executes a function based on a condition.
///
/// Executes [onConditionMet] if the [condition] function returns true,
/// otherwise executes [onConditionNotMet].
///
/// Example:
/// ```dart
/// executeIf(
///   () => age >= 18,
///   onConditionMet: () {
///     print('You are an adult.');
///   },
///   onConditionNotMet: () {
///     print('You are not an adult.');
///   },
/// );
/// ```
void executeIf(
  bool Function() condition, {
  required void Function() onConditionMet,
  required void Function() onConditionNotMet,
}) {
  if (condition()) {
    onConditionMet();
  } else {
    onConditionNotMet();
  }
}

T executeIfAs<T>(
  bool Function() condition, {
  required T Function() onConditionMet,
  required T Function() onConditionNotMet,
}) {
  if (condition()) {
    return onConditionMet();
  } else {
    return onConditionNotMet();
  }
}

/// Calls the provided [value] function if the [nullableValue] is not null and not empty.
///
/// This function is useful for ensuring that an action is performed only when the [nullableValue]
/// contains a non-null and non-empty string.
///
/// Example:
/// ```dart
/// void printValue(String value) {
///   print('The value is: $value');
/// }
///
/// void main() {
///   String? nullableString = 'Hello';
///   notEmpty(nullableString, printValue); // This will print "The value is: Hello"
/// }
/// ```
///
/// The provided [value] function should accept a single argument of type [T], which represents
/// the non-null and non-empty string value.
void notEmpty<T extends String>(T? nullableValue, void Function(T) value) {
  if (nullableValue != null && nullableValue.isNotEmpty) {
    value(nullableValue);
  }
}

/// Extension on `T?` to add an `unwrapped` method.
///
/// This extension provides a convenient way to handle nullable types.
/// The `unwrapped` method takes a function that is applied to the non-null value.
///
/// The function should take a non-null `T`.
///
/// Example usage:
///
/// ```dart
/// var nullableInt = 1;
/// nullableInt.unwrapped((item) => print(item)); // prints: 1
/// ```
extension UnwrappedExtension<T> on T? {
  void unwrapped(void Function(T) value) {
    if (this != null) {
      value(this as T);
    }
  }
}

/// Extension on `T?` where `T` extends `String` to add a `notEmpty` method.
///
/// This extension provides a convenient way to handle nullable strings.
/// The `notEmpty` method takes a function that is applied to the non-null and non-empty string.
///
/// The function should take a non-null `T`.
///
/// Example usage:
///
/// ```dart
/// var nullableString = 'Hello';
/// nullableString.notEmpty((item) => print(item)); // prints: Hello
/// ```
extension NotEmptyExtension<T extends String> on T? {
  void notEmpty(void Function(T) value) {
    if (this != null && this!.isNotEmpty) {
      value(this!);
    }
  }
}

/// Extension on `T?` to add `conditionNotNullWith` and `conditionNotNullAs` methods.
///
/// These methods provide a convenient way to handle nullable types and perform
/// different actions based on the nullability of the value.
///
/// The `conditionNotNullWith` method takes two functions: `conditionTrue` and `conditionFalse`.
/// If the value is not null, it applies the `conditionTrue` function to the value.
/// If the value is null, it calls the `conditionFalse` function.
///
/// The `conditionNotNullAs` method is similar to `conditionNotNullWith`, but it also
/// accepts an optional `condition` function. If the `condition` function is provided
/// and returns true for the non-null value, it applies the `conditionTrue` function to the value.
/// Otherwise, it calls the `conditionFalse` function.
///
/// Example usage:
///
/// ```dart
/// var nullableInt = 1;
/// var result = nullableInt.conditionNotNullWith(
///   (item) => item * 2,  // conditionTrue
///   () => 0,             // conditionFalse
/// );
/// print(result); // prints: 2
///
/// result = nullableInt.conditionNotNullAs(
///   condition: (item) => item > 1,
///   conditionTrue: (item) => item * 2,
///   conditionFalse: () => 0,
/// );
/// print(result); // prints: 0
/// ```
extension ConditionExtension<T> on T? {
  R conditionNotNullWith<R>(
    R Function(T) conditionTrue,
    R Function() conditionFalse,
  ) {
    if (this != null) {
      return conditionTrue(this as T);
    } else {
      return conditionFalse();
    }
  }

  R conditionNotNullAs<R>({
    bool Function(T)? condition,
    required R Function(T) conditionTrue,
    required R Function() conditionFalse,
  }) {
    final defaultCondition = condition ?? ((T value) => true);
    if (this != null && defaultCondition(this as T)) {
      return conditionTrue(this as T);
    } else {
      return conditionFalse();
    }
  }
}

/// Extension on `T` to add `takeIf` and `takeUnless` methods.
///
/// These methods provide a convenient way to conditionally return the value.
///
/// The `takeIf` method takes a predicate function and returns the value if the predicate is true.
/// If the predicate is false, it returns null.
///
/// The `takeUnless` method is the opposite of `takeIf`. It takes a predicate function and returns
/// the value if the predicate is false. If the predicate is true, it returns null.
///
/// Example usage:
///
/// ```dart
/// var value = 5;
/// print(value.takeIf((item) => item > 3)); // prints: 5
/// print(value.takeUnless((item) => item > 3)); // prints: null
/// ```
extension TakeIfExtension<T> on T {
  @pragma('vm:prefer-inline')
  T? takeIf(bool Function(T) predicate) {
    return predicate(this) ? this : null;
  }

  @pragma('vm:prefer-inline')
  T? takeUnless(bool Function(T) predicate) {
    return !predicate(this) ? this : null;
  }
}

/// Extension on `T?` to add a `let` method.
///
/// This extension provides a convenient way to apply a transformation to a nullable value.
/// The `let` method takes a function and applies it to the value if it is not null.
///
/// The function should take a non-null `T` and return a `R`.
///
/// If the value is null, the `let` method returns null.
///
/// Example usage:
///
/// ```dart
/// var nullableInt = 1;
/// var result = nullableInt.let((item) => item * 2);
/// print(result); // prints: 2
/// ```
extension LetExtension<T, R> on T? {
  @pragma('vm:prefer-inline')
  R? let(R Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    return null;
  }
}

/// Extension on `T?` to add a `letNonNull` method.
///
/// This extension provides a convenient way to apply a transformation to a nullable value.
/// The `letNonNull` method takes a function and applies it to the value if it is not null.
///
/// The function should take a non-null `T` and return a nullable `R`.
///
/// If the value is null, the `letNonNull` method returns null.
///
/// Example usage:
///
/// ```dart
/// var nullableInt = 1;
/// var result = nullableInt.letNonNull((item) => item * 2);
/// print(result); // prints: 2
/// ```
extension NullableLetExtension<T, R> on T? {
  @pragma('vm:prefer-inline')
  R? letNonNull(R? Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    return null;
  }
}

/// Extension on `String?` to add utility methods.
///
/// This extension provides two methods:
/// - `isNullOrEmpty`: a getter that checks if the string is null or empty.
/// - `orDefault`: a method that returns the string if it's not null, otherwise it returns a default value.
extension NullableStringExtensions on String? {
  /// Checks if the string is null or empty.
  ///
  /// Returns `true` if the string is null or an empty string, `false` otherwise.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns the string if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the string is null.
  String orDefault(String defaultValue) => this ?? defaultValue;
}
