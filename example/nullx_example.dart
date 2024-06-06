import 'package:nullx/nullx.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const int? nullableInt = 10;
  nullableInt.let((item) => item * 2);
  // print(result); // prints: 2

  final list = [1, null, 3, null];
  list.mapNonNull((item) => item * 2); // prints: [2, 6]

  final list2 = [1, null, 3, null];
  list2.mapNonNullIndexed((item, index) => item * index); // prints: [0, 6]

  // ignore: unnecessary_nullable_for_final_variable_declarations
  List<int>? nullableList = [1, 2, 3];
  nullableList.whatIfNotNullOrEmpty(
    (list) => list,
    () => 'List is null or empty', // whatIfNot
  );
  // prints: [1, 2, 3]

  nullableList.isNullOrEmpty; // prints: false

  nullableList = null;
  nullableList.isNullOrEmpty; // prints: true

  nullableList = [];
  nullableList.isNullOrEmpty; // prints: true

  // ignore: unnecessary_nullable_for_final_variable_declarations
  const String? nullableString = 'example';

  // Unwraps the nullable string and performs an operation on it
  unwrapped(nullableString, (value) {}); // prints: 'example'

  // A list of nullable strings
  final List<String?> strings = [null, 'one', null, 'two', null];

  // Maps over the list, applying a function to each non-null element,
  // then filters out null results and converts the result to a list
  strings.map((s) => s.letNonNull((s) => s.length)).whereType<int>().toList();

  // A list of nullable strings
  final List<String?> strs = [null, 'one', null, 'two', null];

  // Filters out null elements from the list and converts the remaining elements to non-null
  strs.where((element) => element != null).map((e) => e!).toList();

  // Maps over the list, applying a function to each non-null element, and converts the result to a list
  strs.mapNonNull((s) => s.length).toList();

  // A dynamic constant
  const dynamic value = 'Hello';

  // Tries to cast the dynamic value to a String
  final String? name = tryCast<String>(value);

  // Tries to cast the dynamic value to an int
  final int? age = tryCast<int>(value);

  // Performs an operation on the name if it's not null
  name.let((n) => n);

  // Performs an operation on the age if it's not null
  age.let((a) => a);

  nullableInt.letNonNull((value) => value * 2); // prints: 2

  const int userAge = 20;
  executeIf(
    () => userAge >= 18,
    onConditionMet: () {
      // prints 'You are an adult.'
    },
    onConditionNotMet: () {
      // prints 'You are not an adult.'
    },
  );

  executeIfAs<String>(
    () => userAge >= 18,
    ifTrue: () => 'You are an adult.',
    ifFalse: () => 'You are not an adult.',
  );
  // prints: 'You are an adult.'

  // ignore: avoid_print
  notEmpty(nullableString, (s) => print(s)); // prints: 'The value is: example'

  const int? nullableInt2 = null;
  nullableInt2.orZero; // Outputs: 0
  nullableInt2.or(defaultValue: 5); // Outputs: 5

  const double? nullableDouble = null;
  nullableDouble.orZero; // Outputs: 0.0
  nullableDouble.or(defaultValue: 5.5); // Outputs: 5.5

  const bool? nullableBool = null;
  nullableBool.orFalse; // Outputs: false
  nullableBool.or(defaultValue: true); // Outputs: true

  // A placeholder for future code
  todo();
}
