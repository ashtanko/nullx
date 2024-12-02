extension NullableRunesExtensions on Runes? {
  /// Returns the runes if it is not null, otherwise returns an empty runes.
  ///
  /// Returns the runes or an empty runes.
  Runes orEmpty() {
    return this ?? Runes('');
  }

  /// Checks if the runes is null or empty.
  ///
  /// Returns `true` if the runes is null or empty, `false` otherwise.
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  /// Checks if the runes has a value (is not null and not empty).
  ///
  /// Returns `true` if the runes has a value, `false` otherwise.
  bool hasValue() {
    return this != null && this!.isNotEmpty;
  }

  /// Maps each rune to a new value using the provided transform function.
  ///
  /// [transform] The function to apply to each rune.
  /// Returns an iterable of the transformed values or an empty iterable if the
  /// runes is null.
  Iterable<T> map<T>(T Function(int) transform) {
    return this?.map(transform) ?? [];
  }

  /// Joins the runes into a string, using the provided separator.
  ///
  /// [separator] The string to separate each rune. Defaults to an empty string.
  /// Returns the joined string or an empty string if the runes is null.
  String joinAsString([String separator = '']) {
    return this?.map((e) => String.fromCharCode(e)).join(separator) ?? '';
  }

  /// Returns the first rune or null if the runes is null or empty.
  ///
  /// Returns the first rune or null.
  int? firstOrNull() {
    return this?.isEmpty ?? true ? null : this!.first;
  }

  /// Returns the last rune or null if the runes is null or empty.
  ///
  /// Returns the last rune or null.
  int? lastOrNull() {
    return this?.isEmpty ?? true ? null : this!.last;
  }
}
