import 'package:dartz/dartz.dart';

/// Extension on `Either<K, V>` providing additional utility methods.
///
/// This extension adds methods to `Either<K, V>` objects, allowing for more
/// expressive handling of `Either` types, particularly in scenarios where the
/// value might be null.
extension EitherX<K, V> on Either<K, V> {
  /// Returns the value if the `Either` is `Right`; otherwise, returns null.
  ///
  /// Example usage:
  /// ```dart
  /// Either<String, int> either = Right(42);
  /// var value = either.getOrNull(); // returns: 42
  /// ```
  V? getOrNull() => fold((_) => null, (v) => v);

  /// Returns the value if the `Either` is `Right`; otherwise, returns the
  /// provided default value.
  ///
  /// Example usage:
  /// ```dart
  /// Either<String, int> either = Right(42);
  /// var value = either.getOrElse(0); // returns: 42
  /// ```
  V getValueOrElse(V defaultValue) => fold((_) => defaultValue, (v) => v);

  /// Applies a function to the value if the `Either` is `Right`; otherwise,
  /// returns null.
  ///
  /// Example usage:
  /// ```dart
  /// Either<String, int> either = Right(42);
  /// var result = either.mapOrNull((value) => value * 2); // returns: Right(84)
  /// ```
  R? mapOrNull<R>(R Function(V) f) => fold((_) => null, (v) => f(v));

  /// Applies a function returning an `Either` to the value if the `Either` is
  /// `Right`; otherwise, returns null.
  ///
  /// Example usage:
  /// ```dart
  /// Either<String, int> either = Right(42);
  /// Either<String, String> result = either.flatMapOrNull((value)
  ///   => Right(value.toString()));
  /// // returns: Right('42')
  /// ```
  Either<K, R>? flatMapOrNull<R>(Either<K, R> Function(V) f) =>
      fold((_) => null, (v) => f(v));
}
