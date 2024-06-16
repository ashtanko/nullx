/// Extension on `Iterable<T?>` to add a `mapNonNull` method.
///
/// This extension provides a convenient way to map over an iterable
/// where the elements may be null, ignoring those null values.
///
/// The `mapNonNull` method takes a function that is applied to each
/// non-null element of the iterable, and returns a new iterable
/// with the results.
///
/// The function should take a non-null `T` and return a `R`.
///
/// Example usage:
///
/// ```dart
/// var list = [1, null, 3, null];
/// var newList = list.mapNonNull((item) => item * 2);
/// print(newList); // prints: [2, 6]
/// ```
extension NullableMapExtension<T, R> on Iterable<T?> {
  /// Maps over the iterable, applying [block] to each non-null element.
  ///
  /// The [block] function should take a non-null `T` and return a `R`.
  ///
  /// Returns a new iterable with the results of applying [block] to
  /// each non-null element of the original iterable.
  Iterable<R> mapNonNull(R Function(T) block) {
    return where((element) => element != null)
        .map((element) => block(element as T));
  }

  /// Maps over the iterable, applying [block] to each non-null element and
  /// its index.
  ///
  /// The [block] function should take a non-null `T` and an `int` index,
  /// and return a `R`.
  ///
  /// Returns a new iterable with the results of applying [block] to
  /// each non-null element of the original iterable and its index.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var list = [1, null, 3, null];
  /// var newList = list.mapNonNullIndexed((item, index) => item * index);
  /// print(newList); // prints: [0, 6]
  /// ```
  Iterable<R> mapNonNullIndexed(R Function(T, int) block) {
    var index = 0;
    return where((element) => element != null)
        .map((element) => block(element as T, index++));
  }
}

/// Extension on `List<T>?`.
extension WhatIfNotNullOrEmptyExtension<T> on List<T>? {
  /// Executes the [whatIf] function if the list is not null and not empty,
  /// otherwise executes the [whatIfNot] function.
  ///
  /// This function is useful when you need to perform an operation on a list
  /// that could be null or empty.
  ///
  /// The [whatIf] function should accept a single argument of type `List<T>`,
  /// which represents the non-null and non-empty list.
  ///
  /// The [whatIfNot] function should be a function that takes no arguments
  /// and is called when the list is null or empty.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// List<int>? nullableList = [1, 2, 3];
  /// nullableList.whatIfNotNullOrEmpty(
  ///   (list) => print(list),  // whatIf
  ///   () => print('List is null or empty'),  // whatIfNot
  /// );
  /// // prints: [1, 2, 3]
  /// ```
  void whatIfNotNullOrEmpty(
    void Function(List<T>) whatIf,
    void Function() whatIfNot,
  ) {
    if (this != null && this?.isNotEmpty == true) {
      whatIf(this!);
    } else {
      whatIfNot();
    }
  }
}

/// Extension on `Iterable<T>?` to add an `isNullOrEmpty` getter.
///
/// This extension provides a convenient way to check if an iterable is null
/// or empty.
/// The `isNullOrEmpty` getter returns true if the iterable is null or if it
/// is empty.
///
/// Example usage:
///
/// ```dart
/// List<int>? nullableList = [1, 2, 3];
/// print(nullableList.isNullOrEmpty); // prints: false
///
/// nullableList = null;
/// print(nullableList.isNullOrEmpty); // prints: true
///
/// nullableList = [];
/// print(nullableList.isNullOrEmpty); // prints: true
/// ```
extension CollectionExtensions<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
