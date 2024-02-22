import 'package:memo/packages/packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  CustomNotification.initialize();

  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    CustomPortrait().disablePortrait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderInit().provider(
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          navigatorKey: CustomNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: CustomColorStyle.baseLayout,
            appBarTheme: AppBarTheme(
              backgroundColor: CustomColorStyle.transparent,
              elevation: 0,
            ),
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
