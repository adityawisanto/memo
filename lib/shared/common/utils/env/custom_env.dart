import 'package:memo/packages/packages.dart';

class CustomEnv {
  String env(
    String value,
  ) {
    return dotenv.env[value.toUpperCase()].toString();
  }
}
