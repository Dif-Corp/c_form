#ifndef FLUTTER_PLUGIN_C_FORM_PLUGIN_H_
#define FLUTTER_PLUGIN_C_FORM_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace c_form {

class CFormPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CFormPlugin();

  virtual ~CFormPlugin();

  // Disallow copy and assign.
  CFormPlugin(const CFormPlugin&) = delete;
  CFormPlugin& operator=(const CFormPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace c_form

#endif  // FLUTTER_PLUGIN_C_FORM_PLUGIN_H_
