/// Extensions for the [Iterable] class.
extension NullableIterableExtension<T, R> on Iterable<T?> {
  /// Maps over the iterable, applying [block] to each non-null element.
  ///
  /// The [block] function should take a non-null `T` and return a `R`.
  ///
  /// Returns a new iterable with the results of applying [block] to
  /// each non-null element of the original iterable.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, null, 3, null];
  /// var newList = list.mapNonNull((item) => item * 2);
  /// print(newList); // prints: [2, 6]
  /// ```
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

  /// Returns the first non-null element that satisfies the given [test].
  ///
  /// This method iterates through the iterable and applies the [test] function
  /// to each non-null element. If an element satisfies the [test], it returns
  /// that element. If no elements satisfy the [test], it returns null.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, null, 3, null];
  /// var result = list.firstOrNullIndexWhere((item) => item > 2);
  /// print(result); // prints: 3
  /// ```
  T? firstOrNullIndexWhere(bool Function(T) test) {
    for (final element in this) {
      if (element != null && test(element)) {
        return element;
      }
    }
    return null;
  }
}

/// Extensions for the [Iterable] class.
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
  /// and returns a new list with the non-null elements.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, null, 3, null];
  /// var newList = list.filterNotNull();
  /// print(newList); // prints: [1, 3]
  /// ```
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

  /// Returns the length of the iterable if it is not null, otherwise returns 0.
  ///
  /// This method checks if the iterable is null. If it is null, it returns 0.
  /// Otherwise, it returns the length of the iterable.
  ///
  /// Example usage:
  /// ```dart
  /// List<int>? nullableList = [1, 2, 3];
  /// print(nullableList.safeLength()); // prints: 3
  ///
  /// nullableList = null;
  /// print(nullableList.safeLength()); // prints: 0
  /// ```
  int safeLength() => this?.length ?? 0;
}
