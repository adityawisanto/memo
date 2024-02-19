import 'package:memo/packages/packages.dart';

Future<void> checkIntroStockInventory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getStockInventoryIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introStockInventory(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introStockInventory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetStockInventory(
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
      customPreferences.saveStockInventoryIntro(true);
    },
    onSkip: () {
      customPreferences.saveStockInventoryIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetStockInventory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyMenuInventory",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Inventory",
              "Kamu bisa memindahkan tab inventory untuk melihat semua inventory yang kamu punya.",
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
      identify: "keyMenuHistory",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab History",
              "Kamu bisa juga melihat semua history dalam pemakaian inventory.",
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
      identify: "keyInventory",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Inventory",
              "Ini adalah inventory yang kamu miliki beserta kategori dan jumlahnya.",
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
