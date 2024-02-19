import 'package:geolocator/geolocator.dart';
import 'package:memo/packages/packages.dart';

class CustomGeolocation {
  Future<double> longitude() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position.longitude;
  }

  Future<double> latitude() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position.latitude;
  }
}
