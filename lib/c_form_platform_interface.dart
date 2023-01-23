import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'c_form_method_channel.dart';

abstract class CFormPlatform extends PlatformInterface {
  /// Constructs a CFormPlatform.
  CFormPlatform() : super(token: _token);

  static final Object _token = Object();

  static CFormPlatform _instance = MethodChannelCForm();

  /// The default instance of [CFormPlatform] to use.
  ///
  /// Defaults to [MethodChannelCForm].
  static CFormPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CFormPlatform] when
  /// they register themselves.
  static set instance(CFormPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
