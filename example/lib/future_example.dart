import 'package:nullx_future/nullx_future.dart';

void main() async {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFuture = Future.value(42);
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? failedFuture = Future.error(Exception('Failed'));

  // Return a default value if the Future completes with null
  final int result2 = await nullableFuture.orDefault(5);
  // ignore: avoid_print
  print(result2); // 42

  // Return null if the Future completes with an error
  final int? errorHandled = await failedFuture.onErrorReturnNull();
  // ignore: avoid_print
  print(errorHandled); // null

  // Return a default value if the Future completes with an error
  final int? errorHandledWithValue = await failedFuture.onErrorReturn(5);
  // ignore: avoid_print
  print(errorHandledWithValue); // 5

  // Provide an alternative Future if the original completes with null
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? nullableFutureWithNull = Future.value();
  final int alternative = await nullableFutureWithNull.orElse(() async => 99);
  // ignore: avoid_print
  print(alternative); // 99

  // Execute an action when the Future completes
  // ignore: avoid_print
  await nullableFuture.whenComplete(() => print('Completed')); // Completed

  // Ignore any errors the Future may throw
  await failedFuture.ignoreErrors(); // No output, error ignored

  // Timeout a Future and return null if it doesn't complete in time
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Future<int?>? slowFuture =
      Future.delayed(const Duration(seconds: 2), () => 10);
  final int? timedOut =
      await slowFuture.timeoutWithNull(const Duration(seconds: 1));
  // ignore: avoid_print
  print(timedOut); // null

  // Chain another Future using thenOrNull
  final Future<String?> chained =
      nullableFuture.thenOrNull((value) => Future.value('Value: $value'));
  // ignore: avoid_print
  print(await chained); // Value: 42

  // Catch an error and return null using catchErrorOrNull
  final int? caughtError = await failedFuture.catchErrorOrNull((error) {
    // ignore: avoid_print
    print('Caught error: $error');
  });
  // ignore: avoid_print
  print(caughtError); // Caught error: Exception: Failed, null
}
