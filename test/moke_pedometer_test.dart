import 'package:flutter_test/flutter_test.dart';
import 'package:moke_pedometer/moke_pedometer.dart';
import 'package:moke_pedometer/moke_pedometer_platform_interface.dart';
import 'package:moke_pedometer/moke_pedometer_method_channel.dart';
import 'package:moke_pedometer/pedometer_data.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMokePedometerPlatform
    with MockPlatformInterfaceMixin
    implements MokePedometerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<PedoMeterData> queryToday() => Future.value(PedoMeterData(0, 0, 0));
}

void main() {
  final MokePedometerPlatform initialPlatform = MokePedometerPlatform.instance;

  test('$MethodChannelMokePedometer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMokePedometer>());
  });

  test('getPlatformVersion', () async {
    MokePedometer mokePedometerPlugin = MokePedometer();
    MockMokePedometerPlatform fakePlatform = MockMokePedometerPlatform();
    MokePedometerPlatform.instance = fakePlatform;

    expect(await mokePedometerPlugin.getPlatformVersion(), '42');
  });
}
