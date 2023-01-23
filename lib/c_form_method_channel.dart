import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'c_form_platform_interface.dart';

/// An implementation of [CFormPlatform] that uses method channels.
class MethodChannelCForm extends CFormPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('c_form');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
