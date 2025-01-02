/// Extensions for the generic type [T].
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
  /// Example usage:
  /// ```dart
  /// var nullableInt = 1;
  /// var result = nullableInt.notNullWith<int>(
  ///   isTrue: (item) => item * 2,
  ///   isFalse: () => 0,
  /// );
  /// print(result); // prints: 2
  /// ```
  ///
  /// Generic type [R] can be any type and is used for the return type of the
  /// [isTrue] and [isFalse] functions.
  R notNullWith<R>({
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
  /// Example usage:
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

  /// Executes the [action] if the value is null.
  ///
  /// This method is useful when you need to perform an action when a value is
  /// null.
  /// The [action] should be a function that takes no arguments and returns void.
  ///
  /// Returns the original value after executing the [action] if it was null.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var nullableInt = null;
  /// nullableInt = nullableInt.ifNull(() => print('Value was null'));
  /// // prints: 'Value was null'
  /// ```
  T? ifNull(void Function() action) {
    if (this == null) action();
    return this;
  }
}
