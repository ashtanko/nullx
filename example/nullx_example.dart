import 'package:nullx/nullx.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const String? nullableString = 'example';

  // Unwraps the nullable string and performs an operation on it
  unwrapped(nullableString, (value) {});

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

  // A placeholder for future code
  todo();
}
