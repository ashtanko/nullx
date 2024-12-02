import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableFunctionExtensions', () {
    test('callIfNotNull - invokes the function if not null', () {
      var wasCalled = false;
      void testFunction(String message) {
        wasCalled = true;
        expect(message, 'Hello');
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = testFunction;
      nullableFunction.callIfNotNull(['Hello']);
      expect(wasCalled, isTrue);
    });

    test('callIfNotNull - does nothing if the function is null', () {
      const Function? nullableFunction = null;
      nullableFunction
          .callIfNotNull(['Hello']); // Should not throw or change state.
    });

    test('callWithOneArg - invokes a single-argument function if not null', () {
      var capturedMessage = '';
      void singleArgFunction(String message) {
        capturedMessage = message;
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = singleArgFunction;
      nullableFunction.callWithOneArg('Test Message');
      expect(capturedMessage, '');
    });

    test('callWithOneArg - does nothing if the function is null', () {
      const Function? nullableFunction = null;
      nullableFunction.callWithOneArg('Should not crash'); // Should do nothing.
    });

    test('callOrDefault - returns result when function is not null', () {
      int doubleValue(int value) => value * 2;

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = doubleValue;
      final result = nullableFunction.callOrDefault<int>([4], -1);
      expect(result, 8);
    });

    test('callOrDefault - returns default value when function is null', () {
      const Function? nullableFunction = null;
      final result = nullableFunction.callOrDefault<int>([4], -1);
      expect(result, -1);
    });

    test('callAndReturn - returns result when function is not null', () {
      int tripleValue(int value) => value * 3;

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = tripleValue;
      final result = nullableFunction.callAndReturn<int>([3]);
      expect(result, 9);
    });

    test('callAndReturn - returns null when function is null', () {
      const Function? nullableFunction = null;
      final result = nullableFunction.callAndReturn<int>([3]);
      expect(result, isNull);
    });

    test('callAndReturn - handles named arguments if provided', () {
      String concatenate({required String a, required String b}) => '$a$b';

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = concatenate;
      final result = nullableFunction.callAndReturn<String>([], {
        #a: 'Hello, ',
        #b: 'World!',
      });
      expect(result, 'Hello, World!');
    });

    test('callIfNotNull - handles named arguments if provided', () {
      String concatenate({required String a, required String b}) => '$a$b';

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunction = concatenate;
      nullableFunction.callIfNotNull([], {
        #a: 'Test ',
        #b: 'Success',
      });
    });
  });
}
