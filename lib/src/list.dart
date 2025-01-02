import 'package:nullx/nullx.dart';

/// Extensions for the [List] class.
extension NullableListExtension<T> on List<T>? {
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
  void ifNotNullOrEmpty(
    void Function(List<T>) onNotNullOrEmpty,
    void Function() onNullOrEmpty,
  ) {
    if (this != null && this?.isNotEmpty == true) {
      onNotNullOrEmpty(this!);
    } else {
      onNullOrEmpty();
    }
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
