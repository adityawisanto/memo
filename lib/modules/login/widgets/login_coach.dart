import 'package:memo/packages/packages.dart';

Future<void> checkIntroLogin(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getLoginIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introLogin(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introLogin(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetLogin(
      keyIntroduction,
      context,
    ),
    colorShadow: CustomColorStyle.blackPrimary,
    textSkip: "Lewati",
    textStyleSkip: CustomTextStyle.medium(
      12.sp,
      color: CustomColorStyle.white,
    ),
    paddingFocus: 10,
    opacityShadow: 0.8,
    onFinish: () {
      customPreferences.saveLoginIntro(true);
    },
    onSkip: () {
      customPreferences.saveLoginIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetLogin(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyEmail",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Username",
              "Silahkan mengisi username dengan benar sesuai akun yang telah didaftarkan.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.RRect,
      radius: 4,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyPassword",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Password",
              "Silahkan mengisi password dengan benar sesuai akun yang telah didaftarkan.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.RRect,
      radius: 4,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyChapta",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.right,
          builder: (context, controller) {
            return targetContent(
              context,
              "Chapta",
              "Silahkan mengisi chapta dengan benar, jika salah, bisa diulangi kembali.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.RRect,
      radius: 4,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyLogin",
      keyTarget: keyIntroduction[3],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Login",
              "Jika dirasa sudah yakin, maka tekan tombol login untuk melanjutkan. Lalu masukkan nomor hp 4 digit terakhir.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.RRect,
      radius: 4,
    ),
  );
  return targets;
}
