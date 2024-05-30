import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('todo', () {
    test('throws NotImplementedError without reason', () {
      expect(() => todo(), throwsA(isA<NotImplementedError>()));
    });

    test('throws NotImplementedError with reason', () {
      const reason = 'Implement this feature';
      expect(
        () => todo(reason: reason),
        throwsA(
          predicate(
            (e) => e is NotImplementedError && e.message == reason,
          ),
        ),
      );
    });
  });

  group('tryCast', () {
    test('returns input as T when input is of type T', () {
      final result = tryCast<int>(123);
      expect(result, equals(123));
    });

    test('returns null when input is not of type T', () {
      final result = tryCast<int>('123');
      expect(result, isNull);
    });

    test('returns null when input is null', () {
      final result = tryCast<int>(null);
      expect(result, isNull);
    });
  });
}
