import 'package:memo/packages/packages.dart';

Future<void> checkIntroSignature(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getSignatureIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introSignature(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introSignature(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetSignature(
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
      customPreferences.saveSignatureIntro(true);
    },
    onSkip: () {
      customPreferences.saveSignatureIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetSignature(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keySignature",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tanda Tangan",
              "Merchant atau Petugas wajib mengisi tanda tangan.",
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
      identify: "keyName",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Nama Merchant / Petugas",
              "Nama Merchant / Petugas wajib diisi, jika tidak ada kesesuaian, maka kamu dapat merubahnya.",
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
      identify: "keyWa",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "No. HP Merchant / Petugas",
              "No. HP Merchant / Petugas wajib diisi, jika tidak ada kesesuaian, maka kamu dapat merubahnya.",
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
