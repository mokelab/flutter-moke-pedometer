import 'moke_pedometer_platform_interface.dart';

class MokePedometer {
  static Future<Map<Object?, Object?>> queryToday() async {
    return MokePedometerPlatform.instance.queryToday();
  }

  Future<String?> getPlatformVersion() {
    return MokePedometerPlatform.instance.getPlatformVersion();
  }
}
