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

/// Executes one of two functions based on a condition.
///
/// This function takes a condition function that returns a boolean, and two other functions
/// that are executed based on the result of the condition function. If the condition function
/// returns true, it executes the [onConditionMet] function. If the condition function returns
/// false, it executes the [onConditionNotMet] function.
///
/// This function is useful when you need to perform different operations based on a condition.
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

/// Executes one of two functions based on a condition and returns a value of type [T].
///
/// This function takes a condition function that returns a boolean, and two other functions
/// that return a value of type [T]. If the condition function returns true, it executes the
/// [ifTrue] function and returns its result. If the condition function returns false,
/// it executes the [ifFalse] function and returns its result.
///
/// This function is useful when you need to perform different operations and return a result
/// based on a condition.
///
/// Example:
/// ```dart
/// var age = 20;
/// var result = executeIfAs<String>(
///   () => age >= 18,
///   ifTrue: () => 'You are an adult.',
///   ifFalse: () => 'You are not an adult.',
/// );
/// print(result); // prints: 'You are an adult.'
/// ```
///
/// Generic type [T] can be any type and is used for the return type of the [ifTrue] and
/// [ifFalse] functions.
T executeIfAs<T>(
  bool Function() condition, {
  required T Function() ifTrue,
  required T Function() ifFalse,
}) {
  if (condition()) {
    return ifTrue();
  } else {
    return ifFalse();
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

/// Extension on `T?` to add condition-based methods.
///
/// This extension provides a set of methods that allow for condition-based operations
/// on nullable types. These methods include `conditionNotNullWith` and `conditionNotNullAs`,
/// which execute one of two functions based on the nullability of the value and/or a condition,
/// and return a value of a specified type.
///
/// These methods are useful when you need to perform different operations and return a result
/// based on the nullability of a value and/or a condition.
///
/// Example usage:
///
/// ```dart
/// var nullableInt = 1;
/// var result = nullableInt.conditionNotNullWith<int>(
///   isTrue: (item) => item * 2,
///   isFalse: () => 0,
/// );
/// print(result); // prints: 2
///
/// result = nullableInt.conditionNotNullAs<int>(
///   condition: (item) => item > 1,
///   isTrue: (item) => item * 2,
///   isFalse: () => 0,
/// );
/// print(result); // prints: 0
/// ```
///
/// Generic type [T] can be any type and is used for the type of the nullable value.
extension ConditionExtension<T> on T? {
  /// Executes one of two functions based on the nullability of the value and returns a value of type [R].
  ///
  /// This function takes two functions that return a value of type [R]. If the value is not null,
  /// it executes the [isTrue] function and returns its result. If the value is null, it executes
  /// the [isFalse] function and returns its result.
  ///
  /// This function is useful when you need to perform different operations and return a result
  /// based on the nullability of a value.
  ///
  /// Example:
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.conditionNotNullWith<int>(
  ///   isTrue: (item) => item * 2,
  ///   isFalse: () => 0,
  /// );
  /// print(result); // prints: 2
  /// ```
  ///
  /// Generic type [R] can be any type and is used for the return type of the [isTrue] and
  /// [isFalse] functions.
  R conditionNotNullWith<R>(
    R Function(T) isTrue,
    R Function() isFalse,
  ) {
    if (this != null) {
      return isTrue(this as T);
    } else {
      return isFalse();
    }
  }

  /// Executes one of two functions based on a condition and returns a value of type [R].
  ///
  /// This function takes an optional condition function that returns a boolean for a value of type [T],
  /// and two other functions that return a value of type [R]. If the condition function is provided
  /// and returns true for the non-null value, it executes the [isTrue] function and returns its result.
  /// If the condition function is not provided, is false, or the value is null, it executes the [isFalse]
  /// function and returns its result.
  ///
  /// This function is useful when you need to perform different operations and return a result
  /// based on a condition and the nullability of a value.
  ///
  /// Example:
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.conditionNotNullAs<int>(
  ///   condition: (item) => item > 1,
  ///   isTrue: (item) => item * 2,
  ///   isFalse: () => 0,
  /// );
  /// print(result); // prints: 0
  /// ```
  ///
  /// Generic type [R] can be any type and is used for the return type of the [isTrue] and
  /// [isFalse] functions.
  R conditionNotNullAs<R>({
    bool Function(T)? condition,
    required R Function(T) isTrue,
    required R Function() isFalse,
  }) {
    final defaultCondition = condition ?? ((T value) => true);
    if (this != null && defaultCondition(this as T)) {
      return isTrue(this as T);
    } else {
      return isFalse();
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
