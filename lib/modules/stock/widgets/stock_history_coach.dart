import 'package:memo/packages/packages.dart';

Future<void> checkIntroStockHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getStockHistoryIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introStockHistory(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introStockHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetStockHistory(
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
      customPreferences.saveStockHistoryIntro(true);
    },
    onSkip: () {
      customPreferences.saveStockHistoryIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetStockHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyHistory",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "History",
              "Kamu bisa melihat komponen history yang pernah digunakan dimulai dari jumlah, kategori inventory dan kode SN.",
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
