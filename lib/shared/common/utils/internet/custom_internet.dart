import 'package:memo/packages/packages.dart';

class CustomInternet {
  Future<bool> checked() async {
    final connectivityResult = await InternetConnectionChecker().hasConnection;
    if (connectivityResult) {
      return true;
    } else {
      return false;
    }
  }
}
