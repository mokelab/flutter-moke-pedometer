import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:moke_pedometer/pedometer_data.dart';

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
  Future<PedoMeterData> queryToday() async {
    Map<Object?, Object?> data = await methodChannel.invokeMethod("query", {});
    return PedoMeterData.parse(data);
  }
}
