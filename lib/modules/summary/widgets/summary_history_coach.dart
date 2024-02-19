import 'package:memo/packages/packages.dart';

Future<void> checkIntroSummaryHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getSummaryHistoryIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introSummaryHistory(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introSummaryHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetSummaryHistory(
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
      customPreferences.saveSummaryHistoryIntro(true);
    },
    onSkip: () {
      customPreferences.saveSummaryHistoryIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetSummaryHistory(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyInSla",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "In SLA",
              "In SLA adalah ticket yang dikerjakan sebelum masa tenggang atau deadline yang telah diberikan.",
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
      identify: "keyOutSLA",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Out SLA",
              "Out SLA adalah ticket yang dikerjakan sudah melewati masa tenggang atau deadline yang telah diberikan.",
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
