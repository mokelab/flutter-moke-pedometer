
import 'moke_pedometer_platform_interface.dart';

class MokePedometer {
  Future<String?> getPlatformVersion() {
    return MokePedometerPlatform.instance.getPlatformVersion();
  }
}
