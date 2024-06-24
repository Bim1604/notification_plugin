import 'package:flutter_test/flutter_test.dart';
import 'package:notification_plugin/notification_plugin.dart';
import 'package:notification_plugin/notification_plugin_platform_interface.dart';
import 'package:notification_plugin/notification_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNotificationPluginPlatform
    with MockPlatformInterfaceMixin
    implements NotificationPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NotificationPluginPlatform initialPlatform = NotificationPluginPlatform.instance;

  test('$MethodChannelNotificationPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNotificationPlugin>());
  });

  test('getPlatformVersion', () async {
    NotificationPlugin notificationPlugin = NotificationPlugin();
    MockNotificationPluginPlatform fakePlatform = MockNotificationPluginPlatform();
    NotificationPluginPlatform.instance = fakePlatform;

    expect(await notificationPlugin.getPlatformVersion(), '42');
  });
}
