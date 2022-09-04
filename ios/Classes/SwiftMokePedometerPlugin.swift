import Flutter
import UIKit

public class SwiftMokePedometerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "moke_pedometercom.mokelab.flutter.moke_pedometer/channel", binaryMessenger: registrar.messenger())
    let instance = SwiftMokePedometerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    print(call)
    result("iOS " + UIDevice.current.systemVersion)
  }
}
