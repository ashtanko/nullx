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

/// Extension on `Iterable<T>?`.
extension CollectionExtensions<T> on Iterable<T?>? {
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
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Filters non-null elements of the iterable and adds them to the
  /// destination list.
  ///
  /// The [destination] list should be a list where the non-null elements will
  /// be added.
  ///
  /// Returns the destination list with the non-null elements added.
  ///
  /// If the iterable is null or empty, it returns the original
  /// destination list.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var list = [1, null, 3, null];
  /// var destination = <int>[];
  /// list.filterNotNullTo(destination);
  /// print(destination); // prints: [1, 3]
  /// ```
  C filterNotNullTo<C extends List<T>>(C destination) {
    if (this.isNullOrEmpty) return destination;
    for (final element in this!) {
      if (element != null) {
        destination.add(element);
      }
    }
    return destination;
  }

  /// Filters non-null elements of the iterable
  Iterable<T> filterNotNull() {
    return filterNotNullTo(<T>[]);
  }

  /// Returns the last element of the iterable if it is not empty; otherwise,
  /// returns null.
  ///
  /// This method checks if the iterable is empty or null. If it is empty or
  /// null, it returns null. Otherwise, it returns the last element of the
  /// iterable.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, 2, 3];
  /// print(list.lastOrNull()); // prints: 3
  ///
  /// var emptyList = [];
  /// print(emptyList.lastOrNull()); // prints: null
  /// ```
  T? lastOrNull() {
    if (this?.isEmpty == true) {
      return null;
    } else {
      return this?.last!;
    }
  }

  /// Reduces the elements of the iterable to a single value using the provided
  /// [combine] function, or returns null if the iterable is empty.
  ///
  /// This method applies the [combine] function to each element of the iterable
  /// starting with the first two elements, and then combining the result with
  /// the next element, and so on. If the iterable is empty, it returns null.
  ///
  /// [combine] is a function that takes two arguments and returns a single
  /// value.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, 2, 3];
  /// print(list.reduceOrNull((a, b) => a! + b!)); // prints: 6
  ///
  /// var emptyList = [];
  /// print(emptyList.reduceOrNull((a, b) => a! + b!)); // prints: null
  /// ```
  T? reduceOrNull(T Function(T?, T?) combine) {
    if (this?.isEmpty == true) return null;
    return this?.reduce(combine);
  }

  /// Returns the single element of the iterable if it contains exactly one
  /// element; otherwise, returns null.
  ///
  /// This method checks if the iterable contains exactly one element. If it
  /// does, it returns that element. If the iterable is null or contains more
  /// than one element, it returns null.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1];
  /// print(list.singleOrNull()); // prints: 1
  ///
  /// var emptyList = [];
  /// print(emptyList.singleOrNull()); // prints: null
  ///
  /// var multipleElementsList = [1, 2, 3];
  /// print(multipleElementsList.singleOrNull()); // prints: null
  /// ```
  T? singleOrNull() {
    return this?.length == 1 ? this?.single : null;
  }
}

/// Creates a new list containing all non-null elements from the provided list.
///
/// The [elements] list should be a list that may contain null elements.
///
/// The [growable] parameter determines whether the returned list is growable.
/// If [growable] is true, the returned list is growable.
/// If [growable] is false, the returned list is fixed-length.
///
/// Returns a new list with all non-null elements from the original list.
/// If the original list is null or empty, it returns an empty list.
///
/// Example usage:
///
/// ```dart
/// var list = [1, null, 3, null];
/// var newList = listOfNotNull(list);
/// print(newList); // prints: [1, 3]
/// ```
List<T> listOfNotNull<T>(List<T?> elements, {bool growable = true}) {
  return elements.filterNotNull().toList(growable: growable);
}
