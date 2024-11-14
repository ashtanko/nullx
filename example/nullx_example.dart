import 'package:nullx/nullx.dart';

void main() async {
  /// Variables
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<String?>? nullableStringList = [null, 'one', null, 'two', null];
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

  /// Collections
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

  // Throws a [NotImplementedError] indicating that an operation is
  try {
    todo();
  } catch (e) {
    // ignore: avoid_print
    print(e); // prints: An operation is not implemented.
  }
}
