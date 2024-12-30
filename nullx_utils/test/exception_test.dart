import 'package:nullx_utils/nullx_utils.dart';
import 'package:test/test.dart';

void main() {
  group('NotImplementedError', () {
    test('default message is used if no custom message is provided', () {
      final error = NotImplementedError();
      expect(error.message, 'An operation is not implemented.');
      expect(
        error.toString(),
        'NotImplementedError: An operation is not implemented.',
      );
    });

    test('custom message is used if provided', () {
      const customMessage = 'This feature will be implemented soon.';
      final error = NotImplementedError(customMessage);
      expect(error.message, customMessage);
      expect(error.toString(), 'NotImplementedError: $customMessage');
    });

    test('toString returns the correct format', () {
      const customMessage = 'Custom error message.';
      final error = NotImplementedError(customMessage);
      expect(error.toString(), 'NotImplementedError: $customMessage');
    });
  });
}
