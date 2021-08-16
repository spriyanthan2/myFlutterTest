import 'dart:io' show Platform;

class DevicePreference {
  String device;

  getDevice() {
    if (Platform.isIOS) {
      device = 'iOS';
    } else if (Platform.isAndroid) {
      device = 'Andriod';
    } else {
      device = 'other';
    }
    return device;
  }
}
