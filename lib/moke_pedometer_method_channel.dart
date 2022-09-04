import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'moke_pedometer_platform_interface.dart';

/// An implementation of [MokePedometerPlatform] that uses method channels.
class MethodChannelMokePedometer extends MokePedometerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('com.mokelab.flutter.moke_pedometer/channel');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map<Object?, Object?>> queryToday() async {
    return await methodChannel.invokeMethod("query", {});
  }
}
