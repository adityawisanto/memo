import 'package:memo/packages/packages.dart';

Future<void> checkIntroTicket(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getTicketIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introTicket(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introTicket(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetTicket(
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
      customPreferences.saveTicketIntro(true);
    },
    onSkip: () {
      customPreferences.saveTicketIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetTicket(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keySearch",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Search / Pencarian",
              "Cari ticket berdasarkan Nama Merchant, TID, No ticket kamu atau sesuai kebutuhan.",
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
      identify: "keyCheck",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Filter",
              "Jika kamu ingin mengkategorikan ticket berdasarkan kebutuhan, gunakan fitur ini.",
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
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Ticket",
              "Kamu ingin mengerjakan ticket ? Silahkan ditekan card tersebut, atau kamu mau ticket menjadi posisi paling atas ? geser ticket kamu.",
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
