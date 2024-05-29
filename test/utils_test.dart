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
}
