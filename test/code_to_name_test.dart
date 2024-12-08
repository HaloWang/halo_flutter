import 'package:flutter_test/flutter_test.dart';
import 'package:halo/halo.dart';

void main() {
  group('codeToName', () {
    test('should convert snake_case to Title Case', () {
      expect('hello_world'.codeToName, equals('Hello World'));
      expect('user_profile_page'.codeToName, equals('User Profile Page'));
    });

    test('should handle single word', () {
      expect('hello'.codeToName, equals('Hello'));
      expect('test'.codeToName, equals('Test'));
    });

    test('should handle empty string', () {
      expect(''.codeToName, equals(''));
    });

    test('should handle multiple underscores', () {
      expect('hello__world'.codeToName, equals('Hello World'));
      expect('multiple___underscores'.codeToName, equals('Multiple Underscores'));
    });

    test('should convert camelCase to Title Case', () {
      expect("mouseLInScreen".codeToName, equals("Mouse L In Screen"));
    });
  });
}
