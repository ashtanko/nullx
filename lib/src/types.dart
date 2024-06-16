/// A function type alias for a closure that takes an argument of type [T]
/// and returns a value of type [R].
///
/// This is a generic function type where [R] is the return type of the function
/// and [T] is the type of the argument.
///
/// Example usage:
///
/// ```dart
/// Closure<String, int> closure = (int number) => 'Number is: $number';
/// print(closure(5)); // prints: 'Number is: 5'
/// ```
typedef Closure<R, T> = R Function(T it);

/// A function type alias for a closure that takes an argument of type [T] and
/// returns void.
///
/// This is a generic function type where [T] is the type of the argument.
///
/// Example usage:
///
/// ```dart
/// VoidClosure<int> printNumber = (int number) {
///   print('Number is: $number');
/// };
/// printNumber(5); // prints: 'Number is: 5'
/// ```
typedef VoidClosure<T> = void Function(T value);

/// Calls the provided [value] function if the [nullableValue] is not null.
///
/// This function is useful for ensuring that an action is performed only when
/// the [nullableValue] contains a non-null value.
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
/// The provided [value] function should accept a single argument of type [T],
/// which represents the non-null value of [nullableValue].
///
/// Generic type [T] can be inferred automatically based on the type of the
/// provided [nullableValue].
@Deprecated('use unwrapped extension instead, see [UnwrappedExtension]')
void unwrapped<T>(T? nullableValue, VoidClosure value) {
  if (nullableValue != null) {
    value(nullableValue);
  }
}

/// Executes one of two functions based on a condition.
///
/// This function takes a condition function that returns a boolean, and two
/// other functions that are executed based on the result of the condition
/// function. If the condition function returns true, it executes the
/// [onConditionMet] function. If the condition function returns false,
/// it executes the [onConditionNotMet] function.
///
/// This function is useful when you need to perform different operations based
/// on a condition.
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
@Deprecated('use callWhen instead')
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

/// Executes one of two functions based on a condition.
/// The [onMet] function is called when the condition is met, and the [onNotMet]
/// function is called when the condition is not met.
///
/// Example:
/// ```dart
/// callWhen(
///  condition: () => age >= 18,
///  onMet: () {
///  print('You are an adult.');
///  },
///  onNotMet: () {
///  print('You are not an adult.');
///  },
///  );
///  ```
void callWhen({
  required bool Function() condition,
  required void Function() onMet,
  required void Function() onNotMet,
}) {
  if (condition()) {
    onMet();
  } else {
    onNotMet();
  }
}

/// Executes one of two functions based on a condition and returns a value
/// of type [T].
///
/// This function takes a condition function that returns a boolean, and two
/// other functions that return a value of type [T]. If the condition function
/// returns true, it executes the [ifTrue] function and returns its result.
/// If the condition function returns false, it executes the [ifFalse] function
/// and returns its result.
///
/// This function is useful when you need to perform different operations and
/// return a result based on a condition.
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
/// Generic type [T] can be any type and is used for the return type of the
/// [ifTrue] and [ifFalse] functions.
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

/// Calls the provided [value] function if the [nullableValue] is not null
/// and not empty.
///
/// This function is useful for ensuring that an action is performed only when
/// the [nullableValue] contains a non-null and non-empty string.
///
/// Example:
/// ```dart
/// void printValue(String value) {
///   print('$value');
/// }
///
/// void main() {
///   String? nullableString = 'Hello';
///   notEmpty(nullableString, printValue); // This will print "Hello"
/// }
/// ```
///
/// The provided [value] function should accept a single argument of type [T],
/// which represents the non-null and non-empty string value.
@Deprecated('use NotEmptyExtension instead, see [NotEmptyExtension]')
void notEmpty<T extends String>(T? nullableValue, VoidClosure value) {
  if (nullableValue != null && nullableValue.isNotEmpty) {
    value(nullableValue);
  }
}

/// Extension on `T?` to add an `unwrapped` method.
///
/// This extension provides a convenient way to handle nullable types.
/// The `unwrapped` method takes a function that is applied to the non-null
/// value.
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
  void unwrapped(VoidClosure value) {
    if (this != null) {
      value(this as T);
    }
  }
}

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
extension NotEmptyExtension<T extends String> on T? {
  void notEmpty(VoidClosure value) {
    if (this != null && this!.isNotEmpty) {
      value(this);
    }
  }
}

/// Extension on `T?` to add condition-based methods.
///
/// This extension provides a set of methods that allow for condition-based
/// operations on nullable types. These methods include `conditionNotNullWith`
/// and `conditionNotNullAs`, which execute one of two functions based on the
/// nullability of the value and/or a condition, and return a value of a
/// specified type.
///
/// These methods are useful when you need to perform different operations and
/// return a result based on the nullability of a value and/or a condition.
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
/// Generic type [T] can be any type and is used for the type of the nullable
/// value.
extension ConditionExtension<T> on T? {
  /// Executes one of two functions based on the nullability of the value and
  /// returns a value of type [R].
  ///
  /// This function takes two functions that return a value of type [R].
  /// If the value is not null, it executes the [isTrue] function and returns
  /// its result. If the value is null, it executes the [isFalse] function and
  /// returns its result.
  ///
  /// This function is useful when you need to perform different operations and
  /// return a result based on the nullability of a value.
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
  /// Generic type [R] can be any type and is used for the return type of the
  /// [isTrue] and [isFalse] functions.
  R conditionNotNullWith<R>({
    required R Function(T) isTrue,
    required R Function() isFalse,
  }) {
    if (this != null) {
      return isTrue(this as T);
    } else {
      return isFalse();
    }
  }

  /// Executes one of two functions based on a condition and returns a value of
  /// type [R].
  ///
  /// This function takes an optional condition function that returns a boolean
  /// for a value of type [T], and two other functions that return a value of
  /// type [R]. If the condition function is provided and returns true for the
  /// non-null value, it executes the [isTrue] function and returns its result.
  /// If the condition function is not provided, is false, or the value is null,
  /// it executes the [isFalse] function and returns its result.
  ///
  /// This function is useful when you need to perform different operations and
  /// return a result based on a condition and the nullability of a value.
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
  /// Generic type [R] can be any type and is used for the return type of the
  /// [isTrue] and [isFalse] functions.
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
extension TakeIfExtension<T> on T {
  /// Evaluates the given [predicate] function on the value of type [T] and
  /// returns the value if the [predicate] is true, otherwise returns null.
  ///
  /// This function is useful when you need to conditionally return the value
  /// based on a certain condition.
  ///
  /// The [predicate] function should accept a single argument of type [T],
  /// which represents the value, and return a boolean.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 5;
  /// print(value.takeIf((item) => item > 3)); // prints: 5
  /// ```
  ///
  /// @param predicate the function to test on the value
  /// @return the value if the [predicate] is true, otherwise null
  @pragma('vm:prefer-inline')
  T? takeIf(bool Function(T) predicate) {
    return predicate(this) ? this : null;
  }

  /// Evaluates the given [predicate] function on the value of type [T] and
  /// returns the value if the [predicate] is false, otherwise returns null.
  ///
  /// This function is useful when you need to conditionally return the value
  /// based on a certain condition.
  ///
  /// The [predicate] function should accept a single argument of type [T],
  /// which represents the value, and return a boolean.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 5;
  /// print(value.takeUnless((item) => item > 3)); // prints: null
  /// ```
  ///
  /// @param predicate the function to test on the value
  /// @return the value if the [predicate] is false, otherwise null
  @pragma('vm:prefer-inline')
  T? takeUnless(bool Function(T) predicate) {
    return !predicate(this) ? this : null;
  }
}

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
}

/// Extension on `T` to add a `run` method.
extension LetX<T extends Object> on T {
  /// Extension on `T` where `T` extends `Object` to add a `run` method.
  ///
  /// This extension provides a convenient way to apply a transformation to a
  /// non-null value. The `run` method takes a closure and applies it to the
  /// value.
  ///
  /// The closure should take a non-null `T` and return a nullable `R`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nonNullInt = 1;
  /// var result = nonNullInt.run((item) => item * 2);
  /// print(result); // prints: 2
  /// ```
  @pragma('vm:prefer-inline')
  R? run<R>(Closure<R?, T> closure) {
    return closure(this);
  }
}

/// Extension on `T` to add an `also` method.
extension AlsoX<T extends Object?> on T {
  /// Extension on `T` to add an `also` method.
  ///
  /// This extension provides a convenient way to perform an action on a value
  /// and return the same value. The `also` method takes a closure and applies
  /// it to the value.
  ///
  /// The closure should take a `T` and return `void`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var value = 1;
  /// var result = value.also((item) => print(item)); // prints: 1
  /// print(result); // prints: 1
  /// ```
  @pragma('vm:prefer-inline')
  T also(Closure<void, T> closure) {
    closure(this);

    return this;
  }
}

/// Extension on `T?` to add a `letNonNull` method.
extension NullableLetExtension<T, R> on T? {
  /// Applies the [block] function to this value and returns the result if this
  /// value is not null.
  ///
  /// This function is useful when you need to perform a transformation on a
  /// nullable value. The [block] function should accept a single argument of
  /// type [T], which represents the non-null value, and return a value of type [R].
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

/// Extension on `String?` to add utility methods.
///
/// This extension provides two methods:
/// - `isNullOrEmpty`: a getter that checks if the string is null or empty.
/// - `orDefault`: a method that returns the string if it's not null, otherwise
/// it returns a default value.
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
extension NullableIntX on int? {
  /// Returns the integer if it's not null, otherwise it returns zero.
  int get orZero => or();

  /// Returns the integer if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the integer is null.
  /// The default value is zero.
  int or({int defaultValue = 0}) {
    return this ?? defaultValue;
  }
}

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
extension NullableDoubleX on double? {
  /// Returns the double if it's not null, otherwise it returns zero.
  double get orZero => or();

  /// Returns the double if it's not null, otherwise it returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the double is null.
  /// The default value is zero.
  double or({double defaultValue = 0}) {
    return this ?? defaultValue;
  }
}

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
extension NullableBoolX on bool? {
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
