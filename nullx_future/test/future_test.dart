import 'package:nullx_future/nullx_future.dart';
import 'package:test/test.dart';

void main() {
  group('NullableFutureExtensions', () {
    test('orDefault returns default value when future is null', () async {
      Future<int?>? nullFuture;
      expect(await nullFuture.orDefault(10), equals(10));
    });

    test('orDefault returns future value when not null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      expect(await future.orDefault(10), equals(5));
    });

    test('orNull returns null when future is null', () async {
      Future<int?>? nullFuture;
      expect(await nullFuture.orNull(), isNull);
    });

    test('onErrorReturn returns provided value on error', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future<int?>(() => throw Exception());
      expect(await future.onErrorReturn(10), equals(10));
    });

    test('onErrorReturnNull returns null on error', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future<int?>(() => throw Exception());
      expect(await future.onErrorReturnNull(), isNull);
    });

    test('orElse executes alternative future when original is null', () async {
      Future<int?>? nullFuture;
      expect(await nullFuture.orElse(() => Future.value(10)), equals(10));
    });

    test('whenComplete executes action regardless of outcome', () async {
      bool actionExecuted = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      await future.whenComplete(() => actionExecuted = true);
      expect(actionExecuted, isTrue);
    });

    test('ignoreErrors suppresses any errors', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future<int?>(() => throw Exception());
      await future.ignoreErrors();
      // Expectation: no uncaught exceptions
    });

    test('timeoutWithNull returns null on timeout', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future =
          Future<int?>.delayed(const Duration(seconds: 2));
      expect(
        await future.timeoutWithNull(const Duration(milliseconds: 1)),
        isNull,
      );
    });

    test('thenOrNull applies transformation when future is not null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      expect(
        await future.thenOrNull((value) => Future.value(value! * 2)),
        equals(10),
      );
    });
  });

  group('NullableFutureExtensions catchErrorOrNull tests', () {
    test('catchErrorOrNull returns null and executes onError on error',
        () async {
      bool onErrorExecuted = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future<int?>(() => throw Exception());
      expect(
        await future.catchErrorOrNull((_) => onErrorExecuted = true),
        isNull,
      );
      expect(onErrorExecuted, isTrue);
    });

    test('completes successfully when no error occurs', () async {
      final Future<String?> future = Future.value('Success');

      final result = await future.catchErrorOrNull((error) {});

      expect(result, 'Success');
    });

    test('catches error when test function matches the error', () async {
      final Future<String?> future = Future.error(Exception('Test error'));

      final result = await future.catchErrorOrNull(
        // ignore: avoid_print
        (error) => print('Error caught: $error'),
        test: (error) => error is Exception,
      );

      expect(result, isNull);
    });

    test('rethrows error when test function does not match the error',
        () async {
      final Future<String?> future = Future.error('A string error');

      expect(
        () async => await future.catchErrorOrNull(
          // ignore: avoid_print
          (error) => print('Error caught: $error'),
          test: (error) =>
              error is Exception, // Will not match the string error
        ),
        throwsA(isA<String>()),
      );
    });

    test('catches error when no test function is provided', () async {
      final Future<String?> future = Future.error('A string error');

      final result = await future.catchErrorOrNull((error) {
        // ignore: avoid_print
        print('Error caught: $error');
      });

      expect(result, isNull);
    });
  });

  group('handleNull tests', () {
    test('handleNull returns default value when future is null', () async {
      Future<int?>? nullFuture;
      expect(await nullFuture.handleNull(10), equals(10));
    });

    test('handleNull returns future value when not null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      expect(await future.handleNull(10), equals(5));
    });

    test('handleNull returns default value when future value is null',
        () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value();
      expect(await future.handleNull(10), equals(10));
    });
  });

  group('unwrap', () {
    test('unwrap throws error when future is null', () async {
      Future<int?>? nullFuture;
      expect(() => nullFuture.unwrap(), throwsA('Future is null'));
    });

    test('unwrap throws error when future value is null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value();
      expect(() => future.unwrap(), throwsA('Value is null'));
    });

    test('unwrap returns future value when not null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      expect(await future.unwrap(), equals(5));
    });
  });

  group('onSuccess', () {
    test('onSuccess does not call onSuccess when future is null', () async {
      Future<int?>? nullFuture;
      bool onSuccessCalled = false;
      await nullFuture.onSuccess((value) {
        onSuccessCalled = true;
      });
      expect(onSuccessCalled, isFalse);
    });

    test('onSuccess calls onSuccess when future value is not null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      bool onSuccessCalled = false;
      await future.onSuccess((value) {
        onSuccessCalled = true;
        expect(value, equals(5));
      });
      expect(onSuccessCalled, isTrue);
    });

    test('onSuccess does not call onSuccess when future value is null',
        () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value();
      bool onSuccessCalled = false;
      await future.onSuccess((value) {
        onSuccessCalled = true;
      });
      expect(onSuccessCalled, isFalse);
    });
  });

  group('onErrorOrNull', () {
    test('onErrorOrNull does not call onError when future is null', () async {
      Future<int?>? nullFuture;
      bool onErrorCalled = false;
      await nullFuture.onErrorOrNull((error) {
        onErrorCalled = true;
      });
      expect(onErrorCalled, isFalse);
    });

    test('onErrorOrNull calls onError when future throws an error', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future =
          Future<int?>(() => throw Exception('Test error'));
      bool onErrorCalled = false;
      await future.onErrorOrNull((error) {
        onErrorCalled = true;
        expect(error, isA<Exception>());
      });
      expect(onErrorCalled, isTrue);
    });

    test(
        'onErrorOrNull does not call onError when future completes successfully',
        () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      bool onErrorCalled = false;
      await future.onErrorOrNull((error) {
        onErrorCalled = true;
      });
      expect(onErrorCalled, isFalse);
    });
  });

  group('transform', () {
    test('transform returns null when future is null', () async {
      Future<int?>? nullFuture;
      expect(await nullFuture.transform((value) => value * 2), isNull);
    });

    test('transform returns null when future value is null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value();
      expect(await future.transform((value) => value * 2), isNull);
    });

    test('transform applies transformation when future value is not null',
        () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Future<int?>? future = Future.value(5);
      expect(await future.transform((value) => value * 2), equals(10));
    });
  });
}
