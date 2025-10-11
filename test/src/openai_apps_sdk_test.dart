// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:openai_apps_sdk/openai_apps_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIBridge', () {
    test('can be instantiated', () {
      expect(OpenAIBridge(), isNotNull);
    });
  });
}
