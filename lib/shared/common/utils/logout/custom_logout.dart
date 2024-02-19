import 'package:memo/packages/packages.dart';

class CustomLogout {
  Future<void> automationLogout(
    BuildContext context,
  ) async {
    CustomDialog().loading(
      "Maaf, kamu harus login ulang, Proses logout...",
    );
    Timer(const Duration(seconds: 2), () {
      CustomNavigation.intentWithClearAllRoutes(
        context,
        LoginPage.routeName,
      );
    });
  }
}
