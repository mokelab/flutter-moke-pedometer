import Flutter
import UIKit

import CoreMotion

public class SwiftMokePedometerPlugin: NSObject, FlutterPlugin {
    private let pedometer = CMPedometer()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.mokelab.flutter.moke_pedometer/channel", binaryMessenger: registrar.messenger())
        let instance = SwiftMokePedometerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "query" {
            query(result: result)
            return
        }
        result(nil)
    }
    
    private func query(result: @escaping FlutterResult) {
        let calendar = Calendar(identifier: .gregorian)
        let now = Date()
        let dateFrom = calendar.startOfDay(for: now)
        let dateTo = now
        pedometer.queryPedometerData(from: dateFrom, to: dateTo) { (data, error) in
            if data == nil {
                return
            }
            DispatchQueue.main.async {
                result([
                    "steps": data?.numberOfSteps,
                    "floor_up": data?.floorsAscended,
                    "floor_down":data?.floorsDescended,
                ] as [String: Any?])
            }
        }
    }
}
