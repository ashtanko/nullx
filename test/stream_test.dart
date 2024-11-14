import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

void main() {
  group('NullableStreamExtensions', () {
    test('orDefault provides default value when stream is null', () async {
      Stream<int>? nullableStream;
      final result = await nullableStream.orDefault(10).first;
      expect(result, 10);
    });

    test('orDefault returns the original stream when it is non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(5);
      final result = await nullableStream.orDefault(10).first;
      expect(result, 5);
    });

    test('mapIfNotNull transforms stream if non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(2);
      final result = await nullableStream.mapIfNotNull((x) => x * 2)!.first;
      expect(result, 4);
    });

    test('mapIfNotNull returns null when stream is null', () {
      Stream<int>? nullableStream;
      final result = nullableStream.mapIfNotNull((x) => x * 2);
      expect(result, isNull);
    });

    test('listenIfNotNull listens to data if stream is non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(3);
      int? value;
      nullableStream.listenIfNotNull((data) {
        value = data;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      expect(value, 3);
    });

    test('listenIfNotNull does nothing if stream is null', () async {
      Stream<int>? nullableStream;
      int? value = 0;
      nullableStream.listenIfNotNull((data) {
        value = data;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      expect(value, 0);
    });

    test('combineStreams combines multiple non-null streams', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? stream1 = Stream.value(1);
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? stream2 = Stream.value(2);
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? stream3 = Stream.value(3);

      final combined =
          NullableStreamExtensions.combineStreams([stream1, stream2, stream3]);
      final result = await combined.first;
      expect(result, [1, 2, 3]);
    });

    test('combineStreams skips null streams', () async {
      Stream<int>? stream1;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? stream2 = Stream.value(2);
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? stream3 = Stream.value(3);

      final combined =
          NullableStreamExtensions.combineStreams([stream1, stream2, stream3]);
      final result = await combined.first;
      expect(result, [2, 3]);
    });

    test('combineStreams returns empty list if all streams are null', () async {
      Stream<int>? stream1;
      Stream<int>? stream2;

      final combined =
          NullableStreamExtensions.combineStreams([stream1, stream2]);
      final result = await combined.first;
      expect(result, []);
    });

    test(
        'toBroadcastStreamOrEmpty converts stream to broadcast or returns empty'
        ' stream if null', () async {
      Stream<int>? nullableStream = Stream.value(5);
      final Stream<int> broadcastStream =
          nullableStream.toBroadcastStreamOrEmpty();

      expect(broadcastStream.isBroadcast, isTrue);

      nullableStream = null;
      final Stream<int> emptyBroadcastStream =
          nullableStream.toBroadcastStreamOrEmpty();
      expect(await emptyBroadcastStream.isEmpty, isTrue);
    });

    test('firstOrDefault returns first element if stream has data', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(3);
      final int result = await nullableStream.firstOrDefault(10);
      expect(result, 3);
    });

    test('firstOrDefault returns default value if stream is null', () async {
      Stream<int>? nullableStream;
      final int result = await nullableStream.firstOrDefault(10);
      expect(result, 10);
    });

    test('mergeWith merges two streams if first stream is non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.fromIterable([1, 2]);
      final Stream<int> otherStream = Stream.fromIterable([3, 4]);
      final Stream<int> mergedStream = nullableStream.mergeWith(otherStream);

      final result = await mergedStream.toList();
      expect(result, [1, 3, 2, 4]);
    });

    test('mergeWith returns other stream if first stream is null', () async {
      Stream<int>? nullableStream;
      final Stream<int> otherStream = Stream.fromIterable([3, 4]);
      final Stream<int> mergedStream = nullableStream.mergeWith(otherStream);

      final result = await mergedStream.toList();
      expect(result, [3, 4]);
    });

    test('handleNull executes action if stream is null', () async {
      Stream<int>? nullableStream;
      bool actionCalled = false;

      nullableStream.handleNull(() {
        actionCalled = true;
      });

      expect(actionCalled, isTrue);
    });

    test('handleNull does not execute action if stream is non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(5);
      bool actionCalled = false;

      nullableStream.handleNull(() {
        actionCalled = true;
      });

      expect(actionCalled, isFalse);
    });

    test('filterIfNotNull applies filter if stream is non-null', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.fromIterable([1, 2, 3, 4, 5]);
      final Stream<int>? filteredStream =
          nullableStream.filterIfNotNull((value) => value > 3);

      final result = await filteredStream!.toList();
      expect(result, [4, 5]);
    });

    test('filterIfNotNull returns null if stream is null', () {
      Stream<int>? nullableStream;
      final Stream<int>? filteredStream =
          nullableStream.filterIfNotNull((value) => value > 3);
      expect(filteredStream, isNull);
    });

    test('onEmpty executes action if stream is null', () async {
      Stream<int>? nullableStream;
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      expect(actionCalled, isTrue);
    });

    test('onEmpty executes action if stream is empty', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Stream<int>? nullableStream = Stream.empty();
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      await Future.delayed(const Duration(milliseconds: 10));
      expect(actionCalled, isTrue);
    });

    test('onEmpty does not execute action if stream is not empty', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(1);
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      await Future.delayed(const Duration(milliseconds: 10));
      expect(actionCalled, isFalse);
    });

    test('unwrap throws error if stream contains null value', () async {
      final Stream<int?> nullableStream = Stream.value(null);
      expect(() => nullableStream.unwrap().first, throwsA('Value is null'));
    });

    test('unwrap returns stream if it does not contain null values', () async {
      final Stream<int?> nullableStream = Stream.value(5);
      final result = await nullableStream.unwrap().first;
      expect(result, 5);
    });

    test('onEmpty executes action if stream is null', () async {
      Stream<int>? nullableStream;
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      expect(actionCalled, isTrue);
    });

    test('onEmpty executes action if stream is empty', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const Stream<int>? nullableStream = Stream.empty();
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      await Future.delayed(const Duration(milliseconds: 10));
      expect(actionCalled, isTrue);
    });

    test('onEmpty does not execute action if stream is not empty', () async {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Stream<int>? nullableStream = Stream.value(1);
      bool actionCalled = false;

      nullableStream.onEmpty(() {
        actionCalled = true;
      });

      await Future.delayed(const Duration(milliseconds: 10));
      expect(actionCalled, isFalse);
    });
  });
}
