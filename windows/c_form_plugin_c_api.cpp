#include "include/c_form/c_form_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "c_form_plugin.h"

void CFormPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  c_form::CFormPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
