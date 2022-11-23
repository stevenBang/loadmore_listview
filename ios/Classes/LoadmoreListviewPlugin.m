#import "LoadmoreListviewPlugin.h"
#if __has_include(<loadmore_listview/loadmore_listview-Swift.h>)
#import <loadmore_listview/loadmore_listview-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "loadmore_listview-Swift.h"
#endif

@implementation LoadmoreListviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoadmoreListviewPlugin registerWithRegistrar:registrar];
}
@end
