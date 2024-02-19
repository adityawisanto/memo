import 'package:memo/packages/packages.dart';

Future<void> checkIntroLkmPending(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getLkmPendingIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introLkmPending(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introLkmPending(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetLkmPending(
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
      customPreferences.saveLkmPendingIntro(true);
    },
    onSkip: () {
      customPreferences.saveLkmPendingIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetLkmPending(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyClock",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Jam Buka dan Jam Tutup",
              "Pastikan jam buka dan jam tutup merchant sesuai dengan kondisi dilapangan.",
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
      identify: "keyAddressMerchant",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Alamat Merchant",
              "Akan terisi otomatis, jika ada perubahan, kamu bisa merubahnya secara langsung.",
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
      identify: "keyMerchantType",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tipe Merchant",
              "Pastikan tipe merchant sesuai dengan pilihan yang telah disediakan.",
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
      identify: "keyAnotherEDC",
      keyTarget: keyIntroduction[3],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "EDC Lain",
              "Pastikan apakah ada EDC lain atau tidak pada etalase merchant.",
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
      identify: "keyDescription",
      keyTarget: keyIntroduction[4],
      alignSkip: Alignment.topRight,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Keterangan",
              "Isi keterangan sesuai yang telah kamu kerjakan dilapangan.",
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
      identify: "keySelanjutnya",
      keyTarget: keyIntroduction[5],
      alignSkip: Alignment.topLeft,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return targetContent(
              context,
              "Selanjutnya",
              "Jika dirasa sudah benar semua pengisian field atau form, maka kamu bisa ke tahap selanjutnya.",
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

Future<void> checkIntroLkmDone(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  if (await customPreferences.getLkmDoneIntro() != true) {
    Future.delayed(
      const Duration(seconds: 1),
      () => introLkmDone(
        keyIntroduction,
        context,
        customPreferences,
      ),
    );
  }
}

Future<void> introLkmDone(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
  CustomPreferences customPreferences,
) async {
  TutorialCoachMark(
    targets: targetLkmDone(
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
      customPreferences.saveLkmDoneIntro(true);
    },
    onSkip: () {
      customPreferences.saveLkmDoneIntro(true);
      return true;
    },
  ).show(
    context: context,
  );
}

List<TargetFocus> targetLkmDone(
  List<GlobalKey> keyIntroduction,
  BuildContext context,
) {
  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      identify: "keyChecked",
      keyTarget: keyIntroduction[0],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Pengecheckan",
              "Kamu wajib mengisi Tab Pengecheckan. Tab Pengecheckan berisi tentang Purchase, Brizzi, Qris, dan Kelengkapan EDC",
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
      identify: "keyActivity",
      keyTarget: keyIntroduction[1],
      alignSkip: Alignment.bottomLeft,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Aktivitas",
              "Kamu wajib mengisi Tab Aktivitas. Tab Aktivitas berisi tentang Aktivitas dan Note.",
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
      identify: "keyInformation",
      keyTarget: keyIntroduction[2],
      alignSkip: Alignment.bottomRight,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return targetContent(
              context,
              "Tab Informasi",
              "Kamu wajib mengisi Tab Information. berisi tentang Pergantian EDC, Pengurangan Stok Inventory, Jam buka / tutup, Alamat merchant, Tipe Merchant dan EDC lain yang dipakai merchant.",
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
