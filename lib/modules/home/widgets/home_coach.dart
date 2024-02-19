import 'package:memo/packages/packages.dart';

Future<void> checkIntroHome(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getHomeIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introHome(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introHome(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetHome(
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
      customPreferences.saveHomeIntro(true);
    },
    onSkip: () {
      customPreferences.saveHomeIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetHome(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyTicket",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Menu Ticket",
              "Terdapat banyak ticket yang harus kamu kerjakan pada menu ini.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyStock",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Menu Stock",
              "Lihat stock inventory kamu beserta historinya.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keyCheck",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Check (In / Out)",
              "Jika ingin mengerjakan ticket, kamu bisa melakukan check-in terlebih dahulu, jika sudah mengerjakan, kamu bisa menutupnya dengan tombol check-out.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keySummary",
      keyTarget: keyIntroduction[3],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Menu Summary",
              "Kamu bisa melihat statistika dan history ticket yang telah kamu kerjakan selama ini.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ),
  );
  targets.add(
    TargetFocus(
      identify: "keySummary",
      keyTarget: keyIntroduction[4],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Menu Course",
              "Uji kelayakan seorang MERI ada pada menu ini, terdapat banyak soal yang bisa kamu kerjakan dalam ujian modul lama maupun modul baru.",
            );
          },
        ),
      ],
      shape: ShapeLightFocus.Circle,
    ),
  );
  return targets;
}
