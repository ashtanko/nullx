import 'package:nullx/nullx.dart';

void main() async {
  /// Variables

  // ignore: unnecessary_nullable_for_final_variable_declarations
  const int? nullableInt = 10;
  const nonNullInt = 1;
  const int? nullInt = null;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const String? nullableString = 'example';
  const String emptyString = '';
  const String? nullString = null;
  const double? nullDouble = null;
  const bool? nullBool = null;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Map<String, int>? nullableMap = {'a': 1, 'b': 2};
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFuture = Future.value(42);
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? failedFuture = Future.error(Exception('Failed'));

  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<int?>? nullableIntList = [1, null, 3, null];
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<String?>? nullableStringList = [null, 'one', null, 'two', null];
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const List<String?>? nullStringList = null;

  // ignore: unnecessary_nullable_for_final_variable_declarations
  const List<String?>? emptyStringList = [];

  /// Collections

  // Maps over the list, applying a function to each non-null element,
  nullableIntList?.mapNonNull((item) => item * 2); // prints: [2, 6]

  // Maps over the list, applying a function to each non-null element and its
  // index
  // prints: [0, 6]
  nullableIntList?.mapNonNullIndexed((item, index) => item * index);

  nullableIntList.whatIfNotNullOrEmpty(
    (list) => list,
    () => 'List is null or empty', // whatIfNot
  );
  // prints: [1, 2, 3]

  nullableIntList.isNullOrEmpty; // prints: false

  nullStringList.isNullOrEmpty; // prints: true
  emptyStringList.isNullOrEmpty; // prints: true
  nullableStringList.isNullOrEmpty; // prints: false

  // A list of nullable strings
  final List<String?> strs = [null, 'one', null, 'two', null];

  // Filters out null elements from the list and converts the remaining elements to non-null
  strs.where((element) => element != null).map((e) => e!).toList();

  // Maps over the list, applying a function to each non-null element, and converts the result to a list
  strs.mapNonNull((s) => s.length).toList();

  // A dynamic constant
  const dynamic value = 'Hello';

  const int userAge = 20;
  // prints: 'You are an adult.'

  const double? nullableDouble = null;
  nullableDouble.orZero; // Outputs: 0.0
  nullableDouble.or(defaultValue: 5.5); // Outputs: 5.5

  const bool? nullableBool = null;
  nullableBool.orFalse; // Outputs: false
  nullableBool.or(defaultValue: true); // Outputs: true

  /// Types
  // Unwraps the nullable string and performs an operation on it
  callWhen(
    condition: () => userAge >= 18,
    onMet: () {
      // prints 'You are an adult.'
    },
    onNotMet: () {
      // prints 'You are not an adult.'
    },
  );

  // Unwraps the nullable string and performs an operation on it
  final res1 = executeIfAs<String>(
    () => userAge >= 18,
    ifTrue: () => 'You are an adult.',
    ifFalse: () => 'You are not an adult.',
  );

  // ignore: avoid_print
  print(res1); // prints: 'You are an adult.'

  // Unwraps the nullable string and performs an operation on it
  nullableString.unwrapped((value) {}); // prints: 'example'

  // Unwraps the nullable string and performs an operation on it
  // ignore: avoid_print
  nullableString.notEmpty((s) => print(s)); // prints: 'The value is: example'

  // Unwraps the nullable string and performs an operation on it
  final result = nullableInt.notNullWith<int>(
    isTrue: (item) => item * 2,
    isFalse: () => 0,
  );
  // ignore: avoid_print
  print(result); // prints: 20

  final res2 = nullableInt.conditionNotNullAs<int>(
    condition: (value) => value > 5,
    isTrue: (value) => value * 2,
    isFalse: () => -1,
  );

  // ignore: avoid_print
  print(res2); // prints: 20

  // Unwraps the nullable string and performs an operation on it
  const num = 10;
  final res3 = num.takeIf((value) => value > 5);
  // ignore: avoid_print
  print('takeIf: $res3'); // prints: 10

  final res4 = num.takeUnless((value) => value > 5);
  // ignore: avoid_print
  print('takeUnless: $res4'); // prints: 10

  // Unwraps the nullable string and performs an operation on it
  final res5 = nullableInt.let((item) => item * 2);
  // ignore: avoid_print
  print('let: $res5'); // prints: 20

  // Unwraps the nullable string and performs an operation on it
  final res6 = nonNullInt.run((item) => item * 2);
  // ignore: avoid_print
  print('run: $res6'); // prints: 2

  var str = 'Hello';
  str.also((item) => str = item.toUpperCase());
  // ignore: avoid_print
  print('also: $str'); // prints: HELLO

  // Maps over the list, applying a function to each non-null element,
  // then filters out null results and converts the result to a list
  nullableStringList
      ?.map((s) => s.letNonNull((s) => s.length))
      .whereType<int>()
      .toList();

  // ignore: avoid_print
  print('call isNullOrEmpty on null string: ${nullableString.isNullOrEmpty}');

  // ignore: avoid_print
  print('call isNullOrEmpty on empty string: ${emptyString.isNullOrEmpty}');

  final res8 = nullString.orDefault('hi');
  // ignore: avoid_print
  print('orDefault: $res8'); // prints: 'hi'

  // Unwraps the nullable int
  nullInt.orZero; // Outputs: 0
  nullInt.or(defaultValue: 5); // Outputs: 5

  // Unwraps the nullable double
  nullDouble.orZero; // Outputs: 0.0
  nullDouble.or(defaultValue: 5.5); // Outputs: 5.5

  // Unwraps the nullable bool
  nullBool.orFalse; // Outputs: false
  nullBool.or(defaultValue: true); // Outputs: true

  /// Utils

  // Tries to cast the dynamic value to a String
  final String? name = tryCast<String>(value);

  // Tries to cast the dynamic value to an int
  final int? age = tryCast<int>(value);

  // Performs an operation on the name if it's not null
  name.let((n) => n);

  // Performs an operation on the age if it's not null
  age.let((a) => a);

  // Check if the map is null or empty
  // ignore: avoid_print
  print(nullableMap.isNullOrEmpty); // false

  // Get value for key or return default
  // ignore: avoid_print
  print(nullableMap.getOrElse('c', 0)); // 0

  // Put a value if the key is absent
  nullableMap.putIfAbsentOrElse('c', 3);
  // ignore: avoid_print
  print(nullableMap); // {a: 1, b: 2, c: 3}

  // Update a value using a function
  nullableMap.updateValue('a', (value) => value! + 10);
  // ignore: avoid_print
  print(nullableMap); // {a: 11, b: 2, c: 3}
  // ignore: avoid_print

  // Filter the map
  final filteredMap = nullableMap.filter((entry) => entry.value > 2);
  // ignore: avoid_print
  print(filteredMap); // {a: 11, c: 3}

  // Map keys and values
  final mappedMap = nullableMap.mapKeysAndValues(
    (entry) => MapEntry(entry.key.toUpperCase(), entry.value.toString()),
  );
  // ignore: avoid_print
  print(mappedMap); // {A: 11, B: 2, C: 3}

  // Iterate through the map
  // ignore: avoid_print
  nullableMap.forEachEntry((key, value) => print('$key: $value'));
  // Output:
  // a: 11
  // b: 2
  // c: 3

  // Check if the map contains a key or value
  // ignore: avoid_print
  print(nullableMap.containsKeyOrNull('a')); // true
  // ignore: avoid_print
  print(nullableMap.containsValueOrNull(4)); // false

  // Return a default value if the Future completes with null
  final int result2 = await nullableFuture.orDefault(5);
  // ignore: avoid_print
  print(result2); // 42

  // Return null if the Future completes with an error
  final int? errorHandled = await failedFuture.onErrorReturnNull();
  // ignore: avoid_print
  print(errorHandled); // null

  // Return a default value if the Future completes with an error
  final int? errorHandledWithValue = await failedFuture.onErrorReturn(5);
  // ignore: avoid_print
  print(errorHandledWithValue); // 5

  // Provide an alternative Future if the original completes with null
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFutureWithNull = Future.value();
  final int alternative = await nullableFutureWithNull.orElse(() async => 99);
  // ignore: avoid_print
  print(alternative); // 99

  // Execute an action when the Future completes
  // ignore: avoid_print
  await nullableFuture.whenComplete(() => print('Completed')); // Completed

  // Ignore any errors the Future may throw
  await failedFuture.ignoreErrors(); // No output, error ignored

  // Timeout a Future and return null if it doesn't complete in time
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? slowFuture =
      Future.delayed(const Duration(seconds: 2), () => 10);
  final int? timedOut =
      await slowFuture.timeoutWithNull(const Duration(seconds: 1));
  // ignore: avoid_print
  print(timedOut); // null

  // Chain another Future using thenOrNull
  final Future<String?> chained =
      nullableFuture.thenOrNull((value) => Future.value('Value: $value'));
  // ignore: avoid_print
  print(await chained); // Value: 42

  // Catch an error and return null using catchErrorOrNull
  final int? caughtError = await failedFuture.catchErrorOrNull((error) {
    // ignore: avoid_print
    print('Caught error: $error');
  });
  // ignore: avoid_print
  print(caughtError); // Caught error: Exception: Failed, null

  // Throws a [NotImplementedError] indicating that an operation is
  try {
    todo();
  } catch (e) {
    // ignore: avoid_print
    print(e); // prints: An operation is not implemented.
  }
}
