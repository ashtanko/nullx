extension WhenExtensions<T> on T? {
  /// If the value is null, executes the [callback] (useful for side effects)
  /// and returns the fallback value.
  T whenNull(T Function() fallback, {void Function()? callback}) {
    if (this == null) {
      if (callback != null) callback();
      return fallback();
    }
    return this!;
  }
}
