import 'package:async/async.dart' show StreamGroup, StreamZip;

extension NullableStreamExtensions<T> on Stream<T>? {
  /// Returns the stream if it is not null, otherwise returns a stream with the
  /// default value.
  ///
  /// [defaultValue] The value to emit if the stream is null.
  Stream<T> orDefault(T defaultValue) {
    return this ?? Stream.value(defaultValue);
  }

  /// Maps the stream using the provided transform function if the stream is
  /// not null.
  ///
  /// [transform] The function to apply to each element of the stream.
  /// Returns the transformed stream or null if the original stream is null.
  Stream<R>? mapIfNotNull<R>(R Function(T) transform) {
    return this?.map(transform);
  }

  /// Listens to the stream if it is not null.
  ///
  /// [onData] The function to handle data events from the stream.
  void listenIfNotNull(void Function(T) onData) {
    this?.listen(onData);
  }

  /// Combines multiple streams into a single stream of lists of values.
  ///
  /// [streams] The list of streams to combine.
  /// Returns a stream of lists of values from the combined streams.
  static Stream<List<T>> combineStreams<T>(List<Stream<T>?> streams) {
    final nonNullStreams = streams.whereType<Stream<T>>().toList();
    if (nonNullStreams.isEmpty) return Stream.value([]);
    return StreamZip(nonNullStreams).asBroadcastStream();
  }

  /// Unwraps the stream, throwing an error if the stream or any value in the
  /// stream is null.
  ///
  /// Returns the unwrapped stream.
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
  Stream<T> toBroadcastStreamOrEmpty() {
    return this?.asBroadcastStream() ?? const Stream.empty();
  }

  /// Returns the first element of the stream or the default value if the stream
  /// is null or empty.
  ///
  /// [defaultValue] The value to return if the stream is null or empty.
  /// Returns the first element of the stream or the default value.
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
  Stream<T> mergeWith(Stream<T> otherStream) {
    if (this == null) return otherStream;
    return StreamGroup.merge([this!, otherStream]);
  }

  /// Executes the provided action if the stream is null.
  ///
  /// [action] The function to execute if the stream is null.
  void handleNull(void Function() action) {
    if (this == null) action();
  }

  /// Filters the stream using the provided predicate if the stream is not null.
  ///
  /// [predicate] The function to test each element of the stream.
  /// Returns the filtered stream or null if the original stream is null.
  Stream<T>? filterIfNotNull(bool Function(T) predicate) {
    return this?.where(predicate);
  }
}
