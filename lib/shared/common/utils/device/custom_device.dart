import 'package:memo/packages/packages.dart';

class CustomDevice {
  Future<String> getManufactureAndroid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo.manufacturer;
  }

  Future<String> getManufactureIos() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

    return iosDeviceInfo.utsname.machine.toString();
  }

  Future<String> getModelAndroid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo.model;
  }

  Future<String> getModelIos() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

    return iosDeviceInfo.model;
  }

  Future<String> getSystemVersionAndroid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo.version.sdkInt.toString();
  }

  Future<String> getSystemVersionIos() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

    return iosDeviceInfo.systemVersion;
  }

  Future<String> getVersionAndroid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo.version.release;
  }

  Future<String> getVersionIos() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

    return iosDeviceInfo.systemName;
  }
}
