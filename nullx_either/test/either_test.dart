import 'package:dartz/dartz.dart';
import 'package:nullx_either/nullx_either.dart';
import 'package:test/test.dart';

void main() {
  group('EitherX', () {
    test('getOrNull returns value when Right', () {
      const either = Right<String, int>(42);
      expect(either.getOrNull(), equals(42));
    });

    test('getOrNull returns null when Left', () {
      const either = Left<String, int>('error');
      expect(either.getOrNull(), isNull);
    });

    test('getOrNull handles null value in Right', () {
      const either = Right<String, int?>(null);
      expect(either.getOrNull(), isNull);
    });

    test('getOrNull handles null value in Left', () {
      const either = Left<String?, int>('error');
      expect(either.getOrNull(), isNull);
    });

    test('getOrElse returns value when Right', () {
      const either = Right<String, int>(42);
      expect(either.getValueOrElse(0), equals(42));
    });

    test('getOrElse returns default value when Left', () {
      const either = Left<String, int>('error');
      expect(either.getValueOrElse(0), equals(0));
    });

    test('mapOrNull applies function when Right', () {
      const either = Right<String, int>(42);
      expect(either.mapOrNull((v) => v * 2), equals(84));
    });

    test('mapOrNull returns null when Left', () {
      const either = Left<String, int>('error');
      expect(either.mapOrNull((v) => v * 2), isNull);
    });

    test('flatMapOrNull applies function when Right', () {
      const either = Right<String, int>(42);
      expect(
        either.flatMapOrNull((v) => Right<String, int>(v * 2)),
        equals(const Right(84)),
      );
    });

    test('flatMapOrNull returns null when Left', () {
      const either = Left<String, int>('error');
      expect(either.flatMapOrNull((v) => Right<String, int>(v * 2)), isNull);
    });
  });
}
