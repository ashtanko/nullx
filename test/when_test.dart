import 'package:nullx/src/when.dart';
import 'package:test/test.dart';

void main() {
  group('WhenExtensions tests', () {
    test('whenNull returns fallback value when the original value is null', () {
      const String? nullableString = null;
      final result = nullableString.whenNull(() => 'fallback');
      expect(result, 'fallback');
    });

    test('whenNull executes callback when the original value is null', () {
      const String? nullableString = null;
      var callbackExecuted = false;
      nullableString.whenNull(
        () => 'fallback',
        callback: () {
          callbackExecuted = true;
        },
      );
      expect(callbackExecuted, isTrue);
    });

    test('whenNull returns the original value when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = 'original';
      final result = nullableString.whenNull(() => 'fallback');
      expect(result, 'original');
    });

    test(
        'whenNull does not execute callback when the original value is not null',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = 'original';
      var callbackExecuted = false;
      nullableString.whenNull(
        () => 'fallback',
        callback: () {
          callbackExecuted = true;
        },
      );
      expect(callbackExecuted, isFalse);
    });
  });
}
