import 'package:flutter_test/flutter_test.dart';
import 'package:c_form/c_form.dart';
import 'package:c_form/c_form_platform_interface.dart';
import 'package:c_form/c_form_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCFormPlatform
    with MockPlatformInterfaceMixin
    implements CFormPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CFormPlatform initialPlatform = CFormPlatform.instance;

  test('$MethodChannelCForm is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCForm>());
  });

  test('getPlatformVersion', () async {
    // CForm cFormPlugin = CForm();
    MockCFormPlatform fakePlatform = MockCFormPlatform();
    CFormPlatform.instance = fakePlatform;

    // expect(await cFormPlugin.getPlatformVersion(), '42');
  });
}
