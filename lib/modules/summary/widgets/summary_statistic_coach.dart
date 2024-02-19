import 'package:memo/packages/packages.dart';

Future<void> checkIntroSummaryStatistic(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getSummaryStatisticIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introSummaryStatistic(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introSummaryStatistic(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetSummaryStatistic(
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
      customPreferences.saveSummaryStatisticIntro(true);
    },
    onSkip: () {
      customPreferences.saveSummaryStatisticIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetSummaryStatistic(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyMenuStatistic",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Statistik",
              "Kamu bisa memindahkan tab statistik untuk melihat semua statistik ticket yang telah kamu kerjakan.",
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
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab History",
              "Kamu bisa juga melihat semua history ticket yang telah dikerjakan.",
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
      identify: "keyTicket",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Total Ticket",
              "Semua total ticket yang telah di groupping berdasarkan kategorinya.",
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
      identify: "keyFilterTicket",
      keyTarget: keyIntroduction[3],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Kategori Ticket",
              "Cari data statistik berdasarkan ticket sesuai kategori.",
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
