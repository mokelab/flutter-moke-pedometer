import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moke_pedometer/moke_pedometer_method_channel.dart';

void main() {
  MethodChannelMokePedometer platform = MethodChannelMokePedometer();
  const MethodChannel channel = MethodChannel('moke_pedometer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
