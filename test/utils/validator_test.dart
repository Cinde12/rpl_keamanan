import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  group('Validators Test', () {
    test('isValidEmail memvalidasi email dengan benar', () {
      expect(Validators.isValidEmail('test@example.com'), isTrue);
      expect(Validators.isValidEmail('invalid-email'), isFalse);
    });

    test('sanitize membersihkan karakter berbahaya HTML', () {
      const input = '<script>alert("XSS")</script>';
      final sanitized = Validators.sanitize(input);
      expect(sanitized, contains('&lt;script&gt;'));
      expect(sanitized, isNot(contains('<script>')));
    });

    test('validateText memeriksa batas panjang karakter', () {
      expect(
        Validators.validateText('ABC', minLength: 1, maxLength: 5),
        isNull,
      );
      expect(
        Validators.validateText('', minLength: 1, maxLength: 5),
        equals('Field tidak boleh kosong'),
      );
      expect(
        Validators.validateText('123456', minLength: 1, maxLength: 5),
        equals('Field harus antara 1-5 karakter'),
      );
    });

    test('validatePassword memvalidasi aturan keamanan password', () {
      expect(Validators.validatePassword('Pass123!'), isNull);
      expect(
        Validators.validatePassword('weak'),
        equals('Password minimal 8 karakter'),
      );
    });
  });
}
