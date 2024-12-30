import 'package:nullx_types/nullx_types.dart';
import 'package:nullx_utils/nullx_utils.dart';

void main() {
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

  // Throws a [NotImplementedError] indicating that an operation is
  try {
    todo();
  } catch (e) {
    // ignore: avoid_print
    print(e); // prints: An operation is not implemented.
  }
}
