import 'package:nullx_function/nullx_function.dart';

void main() async {
  // Example 1: callIfNotNull
  void greet(String name) {
    // ignore: avoid_print
    print('Hello, $name!');
  }

  Function? nullableFunction = greet;
  // ignore: avoid_print
  print('Example 1: callIfNotNull');
  nullableFunction.callIfNotNull(['Alice']); // Output: Hello, Alice!

  nullableFunction = null;
  nullableFunction.callIfNotNull(['Bob']); // No output

  // ignore: avoid_print
  print('\nExample 2: callWithOneArg');
  // Example 2: callWithOneArg
  void printMessage(String message) {
    // ignore: avoid_print
    print('Message: $message');
  }

  nullableFunction = printMessage;
  nullableFunction
      .callWithOneArg('This is a test.'); // Output: Message: This is a test.

  nullableFunction = null;
  nullableFunction.callWithOneArg('This won’t be printed.'); // No output

  // ignore: avoid_print
  print('\nExample 3: callOrDefault');
  // Example 3: callOrDefault
  int doubleValue(int value) => value * 2;

  nullableFunction = doubleValue;
  int? result = nullableFunction.callOrDefault<int>([5], -1); // Returns: 10
  // ignore: avoid_print
  print('Double value of 5: $result');

  nullableFunction = null;
  result = nullableFunction.callOrDefault<int>([5], -1); // Returns: -1
  // ignore: avoid_print
  print('Default value: $result');

  // ignore: avoid_print
  print('\nExample 4: callAndReturn');
  // Example 4: callAndReturn
  String concatenate({required String a, required String b}) => '$a$b';

  nullableFunction = concatenate;
  String? concatenated = nullableFunction.callAndReturn<String>([], {
    #a: 'Hello, ',
    #b: 'World!',
  }); // Returns: Hello, World!
  // ignore: avoid_print
  print('Concatenated result: $concatenated');

  nullableFunction = null;
  concatenated = nullableFunction.callAndReturn<String>([], {
    #a: 'This ',
    #b: 'won’t be concatenated.',
  }); // Returns: null
  // ignore: avoid_print
  print('Concatenated result when function is null: $concatenated');
}
