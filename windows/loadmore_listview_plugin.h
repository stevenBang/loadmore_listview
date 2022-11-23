#ifndef FLUTTER_PLUGIN_LOADMORE_LISTVIEW_PLUGIN_H_
#define FLUTTER_PLUGIN_LOADMORE_LISTVIEW_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace loadmore_listview {

class LoadmoreListviewPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LoadmoreListviewPlugin();

  virtual ~LoadmoreListviewPlugin();

  // Disallow copy and assign.
  LoadmoreListviewPlugin(const LoadmoreListviewPlugin&) = delete;
  LoadmoreListviewPlugin& operator=(const LoadmoreListviewPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace loadmore_listview

#endif  // FLUTTER_PLUGIN_LOADMORE_LISTVIEW_PLUGIN_H_
