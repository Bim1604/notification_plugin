
import 'notification_plugin_platform_interface.dart';
export 'src/src.dart';

class NotificationPlugin {
  Future<String?> getPlatformVersion() {
    return NotificationPluginPlatform.instance.getPlatformVersion();
  }
}
