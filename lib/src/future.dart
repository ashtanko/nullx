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

  /// Returns the future's value if not null; otherwise, returns a default value.
  ///
  /// [defaultValue] is the value to be returned when the future's value is null.
  Future<T> handleNull(T defaultValue) {
    if (this == null) {
      return Future.value(defaultValue);
    }
    return this!.then((value) => value ?? defaultValue);
  }

  /// Unwraps the future, throwing an error if the future or its value is null.
  ///
  /// Throws an error if the future is null or if the future's value is null.
  Future<T>? unwrap() {
    if (this == null) {
      return Future.error('Future is null');
    }
    return this?.then((value) {
      if (value == null) {
        throw 'Value is null';
      }
      return value;
    });
  }

  /// Executes the provided [onSuccess] function if the future completes
  /// successfully with a non-null value.
  ///
  /// [onSuccess] is the function to be executed when the future completes
  /// successfully with a non-null value.
  Future<void> onSuccess(void Function(T value) onSuccess) {
    if (this == null) {
      return Future.value();
    }
    return this!.then((value) {
      if (value != null) {
        onSuccess(value);
      }
    });
  }

  /// Executes the provided [onError] function if the future completes with
  /// an error.
  ///
  /// [onError] is the function to be executed when the future completes with
  /// an error.
  Future<void> onErrorOrNull(void Function(dynamic error) onError) {
    if (this == null) {
      return Future.value();
    }
    return this!.catchError((error) {
      onError(error);
      return null;
    });
  }

  /// Applies the provided [transform] function to the future's value if it is
  /// not null.
  ///
  /// [transform] is the function to be applied to the future's value if it is
  /// not null.
  Future<R?> transform<R>(R Function(T value) transform) {
    if (this == null) {
      return Future.value();
    }
    return this!.then((value) => value != null ? transform(value) : null);
  }
}
