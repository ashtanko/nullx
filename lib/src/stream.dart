import 'package:async/async.dart' show StreamGroup, StreamZip;

/// Extensions for the [Stream] class.
extension NullableStreamListExtension<T> on List<Stream<T>?> {
  /// Combines multiple streams into a single stream of lists of values.
  ///
  /// [streams] The list of streams to combine.
  /// Returns a stream of lists of values from the combined streams.
  ///
  /// Example usage:
  /// ```dart
  /// var stream1 = Stream.fromIterable([1, 2, 3]);
  /// var stream2 = Stream.fromIterable([4, 5, 6]);
  /// var combinedStream = [stream1, stream2].combineStreams();
  /// await for (var list in combinedStream) {
  ///   print(list); // prints: [1, 4], [2, 5], [3, 6]
  ///   break;
  /// }
  ///  ```
  Stream<List<T>> combineStreams() {
    final nonNullStreams = whereType<Stream<T>>().toList();
    if (nonNullStreams.isEmpty) return Stream.value([]);
    return StreamZip(nonNullStreams).asBroadcastStream();
  }
}

/// Extensions for the [Stream] class.
extension NullableStreamExtension<T> on Stream<T>? {
  /// Returns the stream if it is not null, otherwise returns a stream with the
  /// default value.
  ///
  /// [defaultValue] The value to emit if the stream is null.
  ///
  /// Returns the original stream or a stream with the default value.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = null;
  /// var stream = nullableStream.orDefault(42);
  /// await for (var value in stream) {
  ///  print(value); // prints: 42
  ///  break;
  /// }
  /// ```
  Stream<T> orDefault(T defaultValue) {
    return this ?? Stream.value(defaultValue);
  }

  /// Maps the stream using the provided transform function if the stream is
  /// not null.
  ///
  /// [transform] The function to apply to each element of the stream.
  /// Returns the transformed stream or null if the original stream is null.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = Stream.value(42);
  /// var stream = nullableStream.mapIfNotNull((value) => value + 1);
  /// await for (var value in stream) {
  ///   print(value); // prints: 43
  ///   break;
  ///  }
  ///  ```
  Stream<R>? mapIfNotNull<R>(R Function(T) transform) {
    return this?.map(transform);
  }

  /// Listens to the stream if it is not null.
  ///
  /// [onData] The function to handle data events from the stream.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = Stream.value(42);
  /// nullableStream.listenIfNotNull((value) => print(value));
  /// ```
  void listenIfNotNull(void Function(T) onData) {
    this?.listen(onData);
  }

  /// Unwraps the stream, throwing an error if the stream or any value in the
  /// stream is null.
  ///
  /// Returns the unwrapped stream.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int?>? nullableStream = Stream.value(42);
  /// var stream = nullableStream.unwrap();
  /// await for (var value in stream) {
  ///   print(value); // prints: 42
  ///   break;
  /// }
  ///  ```
  Stream<T> unwrap() {
    if (this == null) {
      return Stream.error('Stream is null');
    }
    return this!.map((value) {
      if (value == null) {
        throw 'Value is null';
      }
      return value;
    });
  }

  /// Executes the provided action if the stream is empty or null.
  ///
  /// [action] The function to execute if the stream is empty or null.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = null;
  /// nullableStream.onEmpty(() => print('Stream is empty'));
  /// ```
  void onEmpty(void Function() action) {
    if (this == null) {
      action();
    } else {
      this!.isEmpty.then((isEmpty) {
        if (isEmpty) action();
      });
    }
  }

  /// Converts the stream to a broadcast stream or returns an empty stream if
  /// the original stream is null.
  ///
  /// Returns the broadcast stream or an empty stream.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = null;
  /// var stream = nullableStream.toBroadcastStreamOrEmpty();
  /// await for (var value in stream) {
  ///  print(value); // No output
  ///  break;
  /// }
  ///  ```
  Stream<T> toBroadcastStreamOrEmpty() {
    return this?.asBroadcastStream() ?? const Stream.empty();
  }

  /// Returns the first element of the stream or the default value if the stream
  /// is null or empty.
  ///
  /// [defaultValue] The value to return if the stream is null or empty.
  /// Returns the first element of the stream or the default value.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = null;
  /// var value = await nullableStream.firstOrDefault(42);
  /// print(value); // prints: 42
  /// ```
  Future<T> firstOrDefault(T defaultValue) async {
    if (this == null) return defaultValue;
    try {
      return await this!.first;
    } catch (_) {
      return defaultValue;
    }
  }

  /// Merges the stream with another stream.
  ///
  /// [otherStream] The stream to merge with.
  /// Returns the merged stream.
  ///
  /// Example usage:
  /// ```dart
  /// var stream1 = Stream.value(1);
  /// var stream2 = Stream.value(2);
  /// var mergedStream = stream1.mergeWith(stream2);
  /// await for (var value in mergedStream) {
  ///  print(value); // prints: 1, 2
  ///  break;
  /// }
  /// ```
  Stream<T> mergeWith(Stream<T> otherStream) {
    if (this == null) return otherStream;
    return StreamGroup.merge([this!, otherStream]);
  }

  /// Executes the provided action if the stream is null.
  ///
  /// [action] The function to execute if the stream is null.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = null;
  /// nullableStream.handleNull(() => print('Stream is null'));
  /// ```
  void handleNull(void Function() action) {
    if (this == null) action();
  }

  /// Filters the stream using the provided predicate if the stream is not null.
  ///
  /// [predicate] The function to test each element of the stream.
  /// Returns the filtered stream or null if the original stream is null.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int>? nullableStream = Stream.value(42);
  /// var stream = nullableStream.filterIfNotNull((value) => value.isEven);
  /// await for (var value in stream) {
  ///  print(value); // prints: 42
  ///  break;
  /// }
  /// ```
  Stream<T>? filterIfNotNull(bool Function(T) predicate) {
    return this?.where(predicate);
  }
}
