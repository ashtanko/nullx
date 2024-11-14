import 'package:nullx/nullx.dart';

void main() {
  const Object? nullObject = null;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  const Object? nullableStringObject = 'Hello';
  // ignore: avoid_print
  print(nullObject.isNull); // true
  // ignore: avoid_print
  print(nullObject.isNotNull); // false
  final result =
      nullableStringObject.mapIfNotNull((it) => (it as String).length);
  // ignore: avoid_print
  print(result); // 5
}
