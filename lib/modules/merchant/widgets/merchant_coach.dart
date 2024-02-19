import 'package:memo/packages/packages.dart';

Future<void> checkIntroMerchant(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getMerchantIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introMerchant(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introMerchant(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetMerchant(
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
      customPreferences.saveMerchantIntro(true);
    },
    onSkip: () {
      customPreferences.saveMerchantIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetMerchant(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyTicket",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tentang Ticket",
              "Kamu bisa melihat informasi detail ticket.",
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
      identify: "keyMerchant",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tentang Merchant",
              "Kamu bisa melihat informasi merchant.",
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
      identify: "keyTerminal",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tentang Terminal",
              "Kamu bisa melihat untuk pengecekan informasi terminal.",
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
      identify: "keyStatus",
      keyTarget: keyIntroduction[3],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Status Pengerjaan",
              "Jika ingin mengerjakan ticket, kamu diwajibkan untuk memilih status pengerjaan sesuai dengan kondisi dilapangan.",
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
