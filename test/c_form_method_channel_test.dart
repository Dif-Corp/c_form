import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:c_form/c_form_method_channel.dart';

void main() {
  MethodChannelCForm platform = MethodChannelCForm();
  const MethodChannel channel = MethodChannel('c_form');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
