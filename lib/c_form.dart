
import 'c_form_platform_interface.dart';

class CForm {
  Future<String?> getPlatformVersion() {
    return CFormPlatform.instance.getPlatformVersion();
  }
}
