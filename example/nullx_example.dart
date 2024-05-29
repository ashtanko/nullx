import 'package:nullx/nullx.dart';

void main() {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const String? nullableString = 'example';
  unwrapped(nullableString, (value) {});
  final List<String?> strings = [null, 'one', null, 'two', null];
  strings.map((s) => s.letNonNull((s) => s.length)).whereType<int>().toList();

  final List<String?> strs = [null, 'one', null, 'two', null];
  strs.where((element) => element != null).map((e) => e!).toList();

  strs.mapNonNull((s) => s.length).toList();
}
