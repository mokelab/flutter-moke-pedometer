#import "MokePedometerPlugin.h"
#if __has_include(<moke_pedometer/moke_pedometer-Swift.h>)
#import <moke_pedometer/moke_pedometer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "moke_pedometer-Swift.h"
#endif

@implementation MokePedometerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMokePedometerPlugin registerWithRegistrar:registrar];
}
@end
