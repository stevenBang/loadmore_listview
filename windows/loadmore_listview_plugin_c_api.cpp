#include "include/loadmore_listview/loadmore_listview_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "loadmore_listview_plugin.h"

void LoadmoreListviewPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  loadmore_listview::LoadmoreListviewPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
