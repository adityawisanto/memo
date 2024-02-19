import 'package:memo/packages/packages.dart';

class CustomPortrait {
  Future<void> disablePortrait() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
