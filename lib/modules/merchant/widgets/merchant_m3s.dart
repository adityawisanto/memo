import 'package:memo/packages/packages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MerchantM3sPage extends StatefulWidget {
  static const routeName = "/m3s";

  final MerchantArgument merchantArgument;

  const MerchantM3sPage({
    super.key,
    required this.merchantArgument,
  });

  @override
  State<MerchantM3sPage> createState() => _MerchantM3sPageState();
}

class _MerchantM3sPageState extends State<MerchantM3sPage> {
  final WebViewController controller = WebViewController();

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://m3smobile.pcsindonesia.co.id/terminal/search?poi=tid&value=${widget.merchantArgument.dataTicket!.poi.toString()}&redirectKey=HkmiP8FuReUPxmPKE5zx",
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "M3S Mobile",
        onTap: () => CustomNavigation.back(context),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
