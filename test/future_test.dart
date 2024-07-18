import 'package:nullx/nullx.dart';
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
  });
}
