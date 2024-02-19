import 'package:memo/packages/packages.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final customPreferences = locator<CustomPreferences>();

  final username = TextEditingController();
  final password = TextEditingController();
  final chapta = TextEditingController();

  final loginBloc = locator<LoginBloc>();
  final userBloc = locator<UserBloc>();

  bool visible = true;
  bool chaperr = false;

  int chaptaPrimary = 0;
  int chaptaSecondary = 0;
  int chaptaResult = 0;

  String? versioning;

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Future<void> getDevice() async {
    versioning = await CustomApplication().getVersion();
    setState(() {
      versioning = versioning;
    });
  }

  Future<void> generateChapta() async {
    chaptaPrimary = Random().nextInt(9) + 1;
    chaptaSecondary = Random().nextInt(9) + 1;
    chaptaResult = chaptaPrimary + chaptaSecondary;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      if (chapta.text.isEmpty) {
        setState(() {
          chaperr = !chaperr;
        });
      } else if (chapta.text == chaptaResult.toString()) {
        loginBloc.add(
          LoginSubmitted(
            username: username.text,
            password: password.text,
          ),
        );
      } else {
        CustomToast.failure(
          "Chapta salah, silahkan ulangi kembali...",
        );
      }
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    chapta.dispose();
    loginBloc.close();
    userBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    getDevice();
    generateChapta();
    checkIntroLogin(
      keyIntroduction,
      context,
      customPreferences,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginLoading) {
            CustomDialog().loading(
              "Proses login...",
            );
          } else if (state is LoginPostSuccess) {
            CustomNavigation.back(context);
            showDialog(
              context: context,
              builder: (context) {
                return const LoginDialog();
              },
            );
          } else if (state is LoginFailure) {
            CustomNavigation.back(context);
            CustomToast.failure(
              state.message,
            );
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: CustomSize.width(context),
            height: CustomSize.height(context),
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
            child: Form(
              key: formKey,
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: LoginForm(
                      keyIntoduction: keyIntroduction,
                      username: username,
                      password: password,
                      chapta: chapta,
                      chaperr: chaperr,
                      onChanged: (value) => setState(() {
                        if (value.isEmpty) {
                          chaperr = true;
                        } else {
                          chaperr = false;
                        }
                      }),
                      obscureText: visible,
                      onPressed: () => setState(() {
                        visible = !visible;
                      }),
                      visiblePassword: visible,
                      chaptaPrimary: chaptaPrimary,
                      chaptaSecondary: chaptaSecondary,
                      onLogin: () async => login(),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/images/splash/pcs_payment.svg",
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Version $versioning",
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.white,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
