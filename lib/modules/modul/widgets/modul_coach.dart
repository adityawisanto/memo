import 'package:memo/packages/packages.dart';

Future<void> checkIntroModul(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getModulIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introModul(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introModul(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetModul(
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
      customPreferences.saveModulIntro(true);
    },
    onSkip: () {
      customPreferences.saveModulIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetModul(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyModul",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Video",
              "Pilih video yang ingin kamu tonton lalu kerjakan ujiannya.",
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
