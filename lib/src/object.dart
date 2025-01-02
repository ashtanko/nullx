extension NullableObjectExtension on Object? {
  /// Checks if the object is null.
  ///
  /// Returns `true` if the object is null, `false` otherwise.
  bool get isNull => this == null;

  /// Checks if the object is not null.
  ///
  /// Returns `true` if the object is not null, `false` otherwise.
  bool get isNotNull => this != null;

  /// Allows chaining a function if the object is not null.
  ///
  /// [operation] The function to apply to the object if it is not null.
  /// Returns the result of the function or `null` if the object is null.
  T? mapIfNotNull<T>(T Function(Object it) operation) {
    if (this != null) {
      return operation(this!);
    }
    return null;
  }

  /// Allows performing an action if the object is not null.
  ///
  /// [action] The function to execute if the object is not null.
  void runWithAction(void Function(Object it) action) {
    if (this != null) {
      action(this!);
    }
  }

  /// Returns the object if it is not null, otherwise returns a default value.
  ///
  /// [defaultValue] The value to return if the object is null.
  /// Returns the object or the default value.
  T orDefault<T>(T defaultValue) {
    if (this != null) {
      return this as T;
    }
    return defaultValue;
  }

  /// Maps the object to another type if it is not null.
  ///
  /// [transform] The function to apply to the object if it is not null.
  /// Returns the transformed object or `null` if the object is null.
  T? map<T>(T Function(Object it) transform) {
    return this != null ? transform(this!) : null;
  }
}
