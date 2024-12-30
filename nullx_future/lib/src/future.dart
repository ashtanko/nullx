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
  ///
  /// [defaultValue] is the value to be returned when the future's value
  /// is null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(null);
  /// var result = await nullableFuture.orDefault(42);
  /// print(result); // prints: 42
  /// ```
  Future<T> orDefault(T defaultValue) async => (await this) ?? defaultValue;

  /// Returns the future's value, or null if the future itself is null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(42);
  /// var result = await nullableFuture.orNull();
  /// print(result); // prints: 42
  /// ```
  Future<T?> orNull() async => await this;

  /// Attempts to return the future's value; on error, returns a specified value
  /// [value] is the value to be returned when an error occurs.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.error('An error occurred');
  /// var result = await nullableFuture.onErrorReturn(42);
  /// print(result); // prints: 42
  /// ```
  Future<T?> onErrorReturn(T value) async {
    try {
      return await this;
    } catch (e) {
      return value;
    }
  }

  /// Attempts to return the future's value; on error, returns null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.error('An error occurred');
  /// var result = await nullableFuture.onErrorReturnNull();
  /// print(result); // prints: null
  /// ```
  Future<T?> onErrorReturnNull() async {
    try {
      return await this;
    } catch (e) {
      return null;
    }
  }

  /// Returns the future's value if not null; otherwise, executes an alternative
  /// future.
  ///
  /// [alternative] is the function that returns an alternative future.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(null);
  /// var result = await nullableFuture.orElse(() => Future.value(42));
  /// print(result); // prints: 42
  /// ```
  Future<T> orElse(Future<T> Function() alternative) async {
    return (await this) ?? await alternative();
  }

  /// Executes a specified action when the future completes, regardless of the
  /// outcome.
  ///
  /// [action] is the function to be executed when the future completes.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(42);
  /// var result = await nullableFuture.whenComplete(() => print('Done'));
  /// print(result); // prints: 42
  /// ```
  Future<T?> whenComplete(Function() action) async {
    try {
      return await this;
    } finally {
      action();
    }
  }

  /// Suppresses any errors that occur during the future's execution.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.error('An error occurred');
  /// var result = await nullableFuture.ignoreErrors();
  /// print(result); // prints: null
  /// ```
  Future<void> ignoreErrors() async {
    try {
      await this;
    } catch (_) {}
  }

  /// Returns null if the future does not complete within a specified duration.
  ///
  /// [duration] is the duration after which the future should time out.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.delayed(Duration(seconds: 2),
  /// () => 42);
  /// var result = await nullableFuture.timeoutWithNull(Duration(seconds: 1));
  /// print(result); // prints: null
  /// ```
  Future<T?> timeoutWithNull(Duration duration) async {
    try {
      return await this?.timeout(duration);
    } catch (e) {
      return null;
    }
  }

  /// Applies the provided [onValue] function to the future's value if it
  /// is not null.
  ///
  /// [onValue] is the function to be applied to the future's value if it is
  /// not null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(42);
  /// var result = await nullableFuture.thenOrNull((value) =>
  /// Future.value(value?.toString()));
  /// print(result); // prints: "42"
  /// ```
  Future<R?> thenOrNull<R>(FutureOr<R?> Function(T?) onValue) async {
    return this == null ? null : await this!.then(onValue);
  }

  /// Attempts to return the future's value; on error, executes an onError
  /// function and returns null.
  ///
  /// [onError] is the function to be executed when an error occurs.
  /// [test] is an optional test function that determines whether the error
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.error('An error occurred');
  /// var result = await nullableFuture.catchErrorOrNull((error) => print(error));
  /// print(result); // prints: null
  /// ```
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

  /// Returns the future's value if not null; otherwise, returns
  /// a default value.
  ///
  /// [defaultValue] is the value to be returned when the future's value
  /// is null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(null);
  /// var result = await nullableFuture.handleNull(42);
  /// print(result); // prints: 42
  /// ```
  Future<T> handleNull(T defaultValue) {
    if (this == null) {
      return Future.value(defaultValue);
    }
    return this!.then((value) => value ?? defaultValue);
  }

  /// Unwraps the future, throwing an error if the future or its value is null.
  ///
  /// Throws an error if the future is null or if the future's value is null.
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(null);
  /// var result = await nullableFuture.unwrap();
  /// print(result); // throws: 'Value is null'
  /// ```
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
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(42);
  /// var result = await nullableFuture.onSuccess((value) => print(value));
  /// print(result); // prints: 42
  /// ```
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
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.error('An error occurred');
  /// var result = await nullableFuture.onError((error) => print(error));
  /// print(result); // prints: 'An error occurred'
  /// ```
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
  ///
  /// Example usage:
  /// ```dart
  /// Future<int?>? nullableFuture = Future.value(42);
  /// var result = await nullableFuture.transform((value) => value.toString());
  /// print(result); // prints: "42"
  /// ```
  Future<R?> transform<R>(R Function(T value) transform) {
    if (this == null) {
      return Future.value();
    }
    return this!.then((value) => value != null ? transform(value) : null);
  }
}
