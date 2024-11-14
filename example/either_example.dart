import 'package:dartz/dartz.dart';
import 'package:nullx/nullx.dart';

void main() async {
  const rightEither = Right<String, int>(42);
  final int? valueOrNull = rightEither.getOrNull();
  final int valueOrElse = rightEither.getValueOrElse(0);
  final int? mappedValue = rightEither.mapOrNull((v) => v * 2);
  final Either<String, int>? flatMappedValue =
      rightEither.flatMapOrNull((v) => Right<String, int>(v * 2));

  // ignore: avoid_print
  print(valueOrNull); // prints: 42
  // ignore: avoid_print
  print(valueOrElse); // prints: 42
  // ignore: avoid_print
  print(mappedValue); // prints: 84
  // ignore: avoid_print
  print(flatMappedValue); // prints: Right(84)
}
