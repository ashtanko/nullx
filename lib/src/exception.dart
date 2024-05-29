/// Exception thrown to indicate that an operation is not implemented.
class NotImplementedError extends Error {
  /// The error message associated with this exception.
  final String message;

  /// Creates a [NotImplementedError] with an optional custom [message].
  ///
  /// If no [message] is provided, a default message indicating that
  /// an operation is not implemented will be used.
  ///
  /// Example:
  /// ```dart
  /// throw NotImplementedError('This feature will be implemented soon.');
  /// ```
  NotImplementedError([this.message = 'An operation is not implemented.']);

  @override
  String toString() {
    return 'NotImplementedError: $message';
  }
}
