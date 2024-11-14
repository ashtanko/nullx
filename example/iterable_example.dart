import 'package:nullx/nullx.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<int?>? nullableIntList = [1, null, 3, null];
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const List<String?>? nullStringList = null;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<String?>? nullableStringList = [null, 'one', null, 'two', null];
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const List<String?>? emptyStringList = [];

  // Maps over the list, applying a function to each non-null element,
  nullableIntList?.mapNonNull((item) => item * 2); // prints: [2, 6]

  // Maps over the list, applying a function to each non-null element and its
  // index
  // prints: [0, 6]
  nullableIntList?.mapNonNullIndexed((item, index) => item * index);

  nullableIntList.isNullOrEmpty; // prints: false

  nullStringList.isNullOrEmpty; // prints: true
  emptyStringList.isNullOrEmpty; // prints: true
  nullableStringList.isNullOrEmpty; // prints: false
}
