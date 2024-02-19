import 'package:memo/packages/packages.dart';

class CustomToast {
  static regular(String msg) {
    Fluttertoast.showToast(
      msg: msg,
    );
  }

  static success(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: CustomColorStyle.greenPrimary.withOpacity(
        0.6,
      ),
    );
  }

  static failure(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: CustomColorStyle.redPrimary,
    );
  }
}
