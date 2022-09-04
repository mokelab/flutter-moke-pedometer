import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'moke_pedometer_method_channel.dart';
import 'pedometer_data.dart';

abstract class MokePedometerPlatform extends PlatformInterface {
  /// Constructs a MokePedometerPlatform.
  MokePedometerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MokePedometerPlatform _instance = MethodChannelMokePedometer();

  /// The default instance of [MokePedometerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMokePedometer].
  static MokePedometerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MokePedometerPlatform] when
  /// they register themselves.
  static set instance(MokePedometerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<PedoMeterData> queryToday() async {
    throw UnimplementedError('queryToday() has not been implemented.');
  }
}
