import 'package:nullx_runes/nullx_runes.dart';

void main() {
  // Example usage of NullableRunesExtensions

  Runes? runes1;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Runes? runes2 = Runes('hello');
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Runes? runes3 = Runes('');

  // orEmpty()
  // ignore: avoid_print
  print(runes1.orEmpty()); // Output: ""
  // ignore: avoid_print
  print(runes2.orEmpty()); // Output: hello
  // ignore: avoid_print
  print(runes3.orEmpty()); // Output: ""

  // isNullOrEmpty()
  // ignore: avoid_print
  print(runes1.isNullOrEmpty()); // Output: true
  // ignore: avoid_print
  print(runes2.isNullOrEmpty()); // Output: false
  // ignore: avoid_print
  print(runes3.isNullOrEmpty()); // Output: true

  // hasValue()
  // ignore: avoid_print
  print(runes1.hasValue()); // Output: false
  // ignore: avoid_print
  print(runes2.hasValue()); // Output: true
  // ignore: avoid_print
  print(runes3.hasValue()); // Output: false

  // map()
  final List<String> mappedRunes =
      runes2.map((rune) => String.fromCharCode(rune)).toList();
  // ignore: avoid_print
  print(mappedRunes); // Output: [h, e, l, l, o]

  // joinAsString()
  final String joinedRunes = runes2.joinAsString('-');
  // ignore: avoid_print
  print(joinedRunes); // Output: h-e-l-l-o

  // firstOrNull()
  // ignore: avoid_print
  print(runes1.firstOrNull()); // Output: null
  // ignore: avoid_print
  print(runes2.firstOrNull()); // Output: 104 (ASCII code for 'h')
  // ignore: avoid_print
  print(runes3.firstOrNull()); // Output: null

  // lastOrNull()
  // ignore: avoid_print
  print(runes1.lastOrNull()); // Output: null
  // ignore: avoid_print
  print(runes2.lastOrNull()); // Output: 111 (ASCII code for 'o')
  // ignore: avoid_print
  print(runes3.lastOrNull()); // Output: null
}
