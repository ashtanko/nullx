/// Extensions for null-aware handling of `Function` types in Dart.
extension NullableFunctionExtension<T> on Function? {
  /// Safely invokes the function if it is not null.
  ///
  /// - [positionalArguments]: A list of positional arguments for the function.
  /// - [namedArguments]: An optional map of named arguments for the function.
  ///
  /// If the function is null, this method does nothing.
  ///
  /// Example:
  /// ```dart
  /// void greet(String name) {
  ///   print('Hello, $name!');
  /// }
  ///
  /// void main() {
  ///   Function? nullableFunction = greet;
  ///   nullableFunction.callIfNotNull(['Alice']); // Prints: Hello, Alice!
  ///
  ///   nullableFunction = null;
  ///   nullableFunction.callIfNotNull(['Bob']); // Does nothing.
  /// }
  /// ```
  void callIfNotNull(
    List<Object?> positionalArguments, [
    Map<Symbol, Object?>? namedArguments,
  ]) {
    if (this != null) {
      Function.apply(this!, positionalArguments, namedArguments);
    }
  }

  /// Safely invokes a single-argument function if it is not null.
  ///
  /// - [arg1]: The single argument for the function.
  ///
  /// If the function is null or does not accept one argument, this method does
  /// nothing.
  ///
  /// Example:
  /// ```dart
  /// void printMessage(String message) {
  ///   print(message);
  /// }
  ///
  /// void main() {
  ///   Function? nullableFunction = printMessage;
  ///   nullableFunction.callWithOneArg('Hello, Dart!'); // Prints: Hello, Dart!
  ///
  ///   nullableFunction = null;
  ///   nullableFunction.callWithOneArg('This won’t be printed.'); // Does
  ///   nothing.
  /// }
  /// ```
  void callWithOneArg(Object? arg1) {
    if (this != null && this is Function(Object?)) {
      (this! as Function(Object?)).call(arg1);
    }
  }

  /// Invokes the function and returns the result, or a default value if null.
  ///
  /// - [positionalArguments]: A list of positional arguments for the function.
  /// - [defaultValue]: A value to return if the function is null.
  /// - [namedArguments]: An optional map of named arguments for the function.
  ///
  /// Example:
  /// ```dart
  /// int doubleValue(int value) => value * 2;
  ///
  /// void main() {
  ///   Function? nullableFunction = doubleValue;
  ///   int result = nullableFunction.callOrDefault([4], -1); // Returns: 8
  ///   print(result);
  ///
  ///   nullableFunction = null;
  ///   result = nullableFunction.callOrDefault([4], -1); // Returns: -1
  ///   print(result);
  /// }
  /// ```
  R? callOrDefault<R>(
    List<Object?> positionalArguments,
    R defaultValue, [
    Map<Symbol, Object?>? namedArguments,
  ]) {
    if (this != null) {
      return Function.apply(this!, positionalArguments, namedArguments) as R?;
    }
    return defaultValue;
  }

  /// Invokes the function and returns the result, or `null` if the function is
  /// null.
  ///
  /// - [positionalArguments]: A list of positional arguments for the function.
  /// - [namedArguments]: An optional map of named arguments for the function.
  ///
  /// Example:
  /// ```dart
  /// int tripleValue(int value) => value * 3;
  ///
  /// void main() {
  ///   Function? nullableFunction = tripleValue;
  ///   int? result = nullableFunction.callAndReturn<int>([3]); // Returns: 9
  ///   print(result);
  ///
  ///   nullableFunction = null;
  ///   result = nullableFunction.callAndReturn<int>([3]); // Returns: null
  ///   print(result);
  /// }
  /// ```
  R? callAndReturn<R>(
    List<Object?> positionalArguments, [
    Map<Symbol, Object?>? namedArguments,
  ]) {
    if (this != null) {
      return Function.apply(this!, positionalArguments, namedArguments) as R?;
    }
    return null;
  }
}
