import 'package:nullx_list/nullx_list.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<int?>? nullableIntList = [1, null, 3, null];
  nullableIntList.ifNotNullOrEmpty(
    (list) => list,
    () => 'List is null or empty', // whatIfNot
  );
  // prints: [1, 2, 3]
}
