/// A function type alias for a closure that takes an argument of type [T]
/// and returns a value of type [R].
///
/// This is a generic function type where [R] is the return type of the function
/// and [T] is the type of the argument.
///
/// Example usage:
///
/// ```dart
/// Closure<String, int> closure = (int number) => 'Number is: $number';
/// print(closure(5)); // prints: 'Number is: 5'
/// ```
typedef Closure<R, T> = R Function(T it);

/// A function type alias for a closure that takes an argument of type [T] and
/// returns void.
///
/// This is a generic function type where [T] is the type of the argument.
///
/// Example usage:
///
/// ```dart
/// VoidClosure<int> printNumber = (int number) {
///   print('Number is: $number');
/// };
/// printNumber(5); // prints: 'Number is: 5'
/// ```
typedef VoidClosure<T> = void Function(T value);
