import 'package:flutter_test/flutter_test.dart';
import 'package:thetamedbot/pages/signin_page/validators.dart';

void main() {
  test('empty email returns error string', () {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Invalid email');
  });

  test('non-empty email returns null', () {
    final result = EmailFieldValidator.validate('kushvatsa007@gmail.com');
    expect(result, null);
  });

  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('');
    expect(result, 'Strong passwords have at least 6 characters');
  });

  test('non-empty password returns null', () {
    final result = PasswordFieldValidator.validate('1234567');
    expect(result, null);
  });
}
