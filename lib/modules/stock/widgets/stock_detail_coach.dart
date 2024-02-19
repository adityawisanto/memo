import 'package:memo/packages/packages.dart';

Future<void> checkIntroStockDetail(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getStockDetailIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introStockDetail(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introStockDetail(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetStockDetail(
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
      customPreferences.saveStockDetailIntro(true);
    },
    onSkip: () {
      customPreferences.saveStockDetailIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetStockDetail(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyStockDescription",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Total Item",
              "Kamu bisa melihat total keseluruhan pada satu item.",
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
      identify: "keyStockList",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tabel Histori",
              "Semua pemakaian item akan tertera pada tabel ini.",
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
