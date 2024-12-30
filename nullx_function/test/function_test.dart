import 'package:nullx_function/nullx_function.dart';
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

    test('callWithOneArg should do nothing when the function is null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Function? func = null;
      expect(() => func.callWithOneArg('test'), returnsNormally);
    });

    test(
        'callWithOneArg should do nothing when the function is not callable with one argument',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      void func() {
        // ignore: avoid_print
        print('No args');
      }

      expect(() => func.callWithOneArg('test'), returnsNormally);
    });

    test(
        'callWithOneArg should call the function with one argument when compatible',
        () {
      var called = false;
      Object? receivedArg;
      void func(Object? arg1) {
        called = true;
        receivedArg = arg1;
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunc = func;
      nullableFunc.callWithOneArg('test');

      expect(called, isTrue);
      expect(receivedArg, 'test');
    });

    test(
        'callWithOneArg should do nothing when the function expects more than one argument',
        () {
      void func(Object? arg1, Object? arg2) {
        // Should not be called
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunc = func;
      expect(() => nullableFunc.callWithOneArg('test'), returnsNormally);
    });

    test('should do nothing when the function expects no arguments', () {
      void func() {
        // Should not be called
      }

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Function? nullableFunc = func;
      expect(() => nullableFunc.callWithOneArg('test'), returnsNormally);
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
