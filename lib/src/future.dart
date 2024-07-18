import 'dart:async';

/// Extension on `Future<T?>?` providing additional null-aware and error
/// handling operations.
///
/// This extension adds methods to nullable `Future<T?>` objects, allowing for
/// more expressive handling of asynchronous operations that could result in
/// null or error states. It includes methods for providing default values,
/// handling errors gracefully, and more nuanced manipulations like executing
/// alternative futures or suppressing errors.
extension NullableFutureExtensions<T> on Future<T?>? {
  /// Returns the future's value if not null; otherwise, returns a default value
  Future<T> orDefault(T defaultValue) async => (await this) ?? defaultValue;

  /// Returns the future's value, or null if the future itself is null.
  Future<T?> orNull() async => await this;

  /// Attempts to return the future's value; on error, returns a specified value
  Future<T?> onErrorReturn(T value) async {
    try {
      return await this;
    } catch (e) {
      return value;
    }
  }

  /// Attempts to return the future's value; on error, returns null.
  Future<T?> onErrorReturnNull() async {
    try {
      return await this;
    } catch (e) {
      return null;
    }
  }

  /// Returns the future's value if not null; otherwise, executes an alternative
  /// future.
  Future<T> orElse(Future<T> Function() alternative) async {
    return (await this) ?? await alternative();
  }

  /// Executes a specified action when the future completes, regardless of the
  /// outcome.
  Future<T?> whenComplete(Function() action) async {
    try {
      return await this;
    } finally {
      action();
    }
  }

  /// Suppresses any errors that occur during the future's execution.
  Future<void> ignoreErrors() async {
    try {
      await this;
    } catch (_) {}
  }

  /// Returns null if the future does not complete within a specified duration.
  Future<T?> timeoutWithNull(Duration duration) async {
    try {
      return await this?.timeout(duration);
    } catch (e) {
      return null;
    }
  }

  /// Applies a transformation to the future's value if not null.
  Future<R?> thenOrNull<R>(FutureOr<R?> Function(T?) onValue) async {
    return this == null ? null : await this!.then(onValue);
  }

  /// Attempts to return the future's value; on error, executes an onError
  /// function and returns null.
  Future<T?> catchErrorOrNull(
    Function(Object) onError, {
    bool Function(Object)? test,
  }) async {
    try {
      return await this;
    } catch (e) {
      if (test == null || test(e)) {
        onError(e);
        return null;
      }
      rethrow;
    }
  }
}
