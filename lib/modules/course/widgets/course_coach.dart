import 'package:memo/packages/packages.dart';

Future<void> checkIntroCourse(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getCourseIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introCourse(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introCourse(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetCourse(
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
      customPreferences.saveCourseIntro(true);
    },
    onSkip: () {
      customPreferences.saveCourseIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetCourse(
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
              "Modul",
              "Kamu bisa melihat total keseluruhan modul.",
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
      identify: "keyCategory",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Category",
              "Disini ada beberapa modul yang dapat kamu kerjakan.",
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
      identify: "keyPoint",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Total Point",
              "Total keseluruhan point kamu setelah mengerjakan modul.",
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
