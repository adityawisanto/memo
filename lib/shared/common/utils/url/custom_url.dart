import 'package:memo/packages/packages.dart';

class CustomUrl {
  Future<void> launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = Platform.isAndroid
        ? "https://www.google.com/maps/search/?api=1&query=$query"
        : Platform.isIOS
            ? "https://maps.apple.com/?q=$query"
            : "https://www.google.com/";

    if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    }
  }
}
