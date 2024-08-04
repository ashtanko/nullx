import 'package:dartz/dartz.dart';

/// Extension on `Either<K, V>` providing additional utility methods.
///
/// This extension adds methods to `Either<K, V>` objects, allowing for more
/// expressive handling of `Either` types, particularly in scenarios where the
/// value might be null.
extension EitherX<K, V> on Either<K, V> {
  /// Returns the value if the `Either` is `Right`; otherwise, returns null.
  V? getOrNull() => fold((_) => null, (v) => v);

  /// Returns the value if the `Either` is `Right`; otherwise, returns the
  /// provided default value.
  V getValueOrElse(V defaultValue) => fold((_) => defaultValue, (v) => v);

  /// Applies a function to the value if the `Either` is `Right`; otherwise,
  /// returns null.
  R? mapOrNull<R>(R Function(V) f) => fold((_) => null, (v) => f(v));

  /// Applies a function returning an `Either` to the value if the `Either` is
  /// `Right`; otherwise, returns null.
  Either<K, R>? flatMapOrNull<R>(Either<K, R> Function(V) f) =>
      fold((_) => null, (v) => f(v));
}
