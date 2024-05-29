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
