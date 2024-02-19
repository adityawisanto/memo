import 'package:memo/packages/packages.dart';

Future<void> checkIntroProfile(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getProfileIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introProfile(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introProfile(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetProfile(
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
      customPreferences.saveProfileIntro(true);
    },
    onSkip: () {
      customPreferences.saveProfileIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetProfile(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyProfile",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Foto Profile",
              "Ganti foto profile pada bagian ini.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
      radius: 4,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyOutSLA",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.topCenter,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Logout",
              "Ingin keluar dari aplikasi ? kamu bisa tekan tombol logout.",
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
