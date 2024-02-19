import 'package:memo/packages/packages.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/splash";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final customPreferences = locator<CustomPreferences>();

  Future<Timer> startSplashScreen() async {
    final token = await customPreferences.getToken();
    final verifyToken = await customPreferences.getVerifyToken();
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () async {
        if (token.isNotEmpty && verifyToken.isNotEmpty) {
          CustomNavigation.intentWithClearAllRoutes(
            context,
            HomePage.routeName,
          );
        } else {
          CustomNavigation.intentWithClearAllRoutes(
            context,
            LoginPage.routeName,
          );
        }
      },
    );
  }

  Future<void> checkPermission() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.camera,
      Permission.location,
      Permission.storage,
      Permission.notification,
    ].request();

    if (status[Permission.camera] == PermissionStatus.granted) {
      // here what ever your need is to fullfilled
    }
    if (status[Permission.camera] == PermissionStatus.denied) {
      debugPrint("This permission is recommended");
    }
    if (status[Permission.camera] == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    checkPermission().then(
      (value) => startSplashScreen(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: CustomSize.width(context),
        height: CustomSize.height(context),
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              CustomColorStyle.redPrimary,
              CustomColorStyle.redSecondary,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/splash/meri.png",
            ),
            Text(
              "MEMO",
              style: CustomTextStyle.bold(
                34.sp,
                color: CustomColorStyle.orangePrimary,
              ),
            ),
            Text(
              "MERI Mobile",
              style: CustomTextStyle.regular(
                14.sp,
                color: CustomColorStyle.white,
                letterSpacing: 2,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/images/splash/pcs_payment.svg",
              width: 16.w,
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
