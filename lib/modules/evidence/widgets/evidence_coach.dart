import 'package:memo/packages/packages.dart';

Future<void> checkIntroEvidence(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getEvidenceIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introEvidence(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introEvidence(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetEvidence(
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
      customPreferences.saveEvidenceIntro(true);
    },
    onSkip: () {
      customPreferences.saveEvidenceIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetEvidence(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyEvidence",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Foto Pembuktian",
              "Pilih foto bukti dari kamera atau gallery atau keduanya untuk ke tahap selanjutnya.",
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
