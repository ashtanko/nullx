import 'package:nullx/nullx.dart';

/// Throws a [NotImplementedError] indicating that an operation is not implemented.
///
/// If a [reason] is provided, it will be included in the error message.
///
/// Example:
/// ```dart
/// todo(reason: 'Implement this feature');
/// ```
@pragma('vm:prefer-inline')
Never todo({String reason = 'An operation is not implemented.'}) {
  throw NotImplementedError(reason);
}

/// Tries to cast the input [x] to the specified type [T].
///
/// If the input [x] is of type [T], it returns the input as [T].
/// Otherwise, it returns null.
///
/// Example:
/// ```dart
/// int? number = tryCast<int>('123'); // returns null
/// String? text = tryCast<String>('Hello'); // returns 'Hello'
/// ```
T? tryCast<T>(dynamic x) => x is T ? x : null;
