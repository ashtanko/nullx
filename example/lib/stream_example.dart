import 'package:nullx_stream/nullx_stream.dart';

void main() async {
  // Example 1: orDefault
  Stream<int>? stream1;
  final Stream<int> streamWithDefault = stream1.orDefault(0);
  // ignore: avoid_print
  streamWithDefault.listen(print); // Output: 0

  // Example 2: mapIfNotNull
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream2 = Stream.fromIterable([1, 2, 3]);
  final Stream<String>? mappedStream =
      stream2.mapIfNotNull((value) => 'Value: $value');
  // ignore: avoid_print
  mappedStream?.listen(print); // Output: Value: 1, Value: 2, Value: 3

  // Example 3: combineStreams
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream3 = Stream.fromIterable([1, 2]);
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream4 = Stream.fromIterable([3, 4]);
  const Stream<int>? stream5 = null;
  final Stream<List<int>> combinedStream =
      NullableStreamExtensions.combineStreams([stream3, stream4, stream5]);
  // ignore: avoid_print
  combinedStream.listen(print); // Output: [1, 3], [2, 4]

  // Example 4: firstOrDefault
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream6 = Stream.fromIterable([1, 2, 3]);
  final int firstValue = await stream6.firstOrDefault(0);
  // ignore: avoid_print
  print(firstValue); // Output: 1

  // Example 5: mergeWith
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream7 = Stream.fromIterable([1, 2]);
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream8 = Stream.fromIterable([3, 4]);
  final Stream<int> mergedStream = stream7.mergeWith(stream8!);
  // ignore: avoid_print
  mergedStream.listen(print); // Output: 1, 2, 3, 4

  // Example 6: handleNull
  Stream<int>? stream9;
  // ignore: avoid_print
  stream9.handleNull(() => print('Stream is null')); // Output: Stream is null

  // Example 7: filterIfNotNull
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final Stream<int>? stream10 = Stream.fromIterable([1, 2, 3, 4, 5]);
  final Stream<int>? filteredStream =
      stream10.filterIfNotNull((value) => value > 2);
  // ignore: avoid_print
  filteredStream?.listen(print); // Output: 3, 4, 5
}
