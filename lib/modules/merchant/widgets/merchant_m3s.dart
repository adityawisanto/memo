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

  bool? loading = true;

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              loading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(
        Uri.parse(
          "${CustomEnv().env("M3S")}${widget.merchantArgument.dataTicket!.poi.toString()}&redirectKey=${CustomEnv().env("REDIRECT_KEY")}",
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
      body: loading == true
          ? LinearProgressIndicator(
              color: CustomColorStyle.orangePrimary,
              backgroundColor: CustomColorStyle.grayPrimary.withOpacity(0.1),
            )
          : WebViewWidget(
              controller: controller,
            ),
    );
  }
}
