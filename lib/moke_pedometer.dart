import 'moke_pedometer_platform_interface.dart';
import 'pedometer_data.dart';

class MokePedometer {
  static Future<PedoMeterData> queryToday() async {
    return MokePedometerPlatform.instance.queryToday();
  }

  Future<String?> getPlatformVersion() {
    return MokePedometerPlatform.instance.getPlatformVersion();
  }
}
