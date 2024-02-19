import 'package:memo/packages/packages.dart';

class HomeDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool lock;

  const HomeDialog({
    super.key,
    required this.onPressed,
    required this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "CHECK IN",
                      style: CustomTextStyle.bold(
                        12.sp,
                        color: CustomColorStyle.orangePrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    lock == true
                        ? "MERi tangguh seperti kamu pasti sudah siap untuk memulai.\nTekan `OK` untuk check-in sekarang!"
                        : "Dengan senyuman, tekan `OK` untuk menutup lembaran hari ini.\nSampai jumpa besok!",
                    style: CustomTextStyle.regular(
                      12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          backgroundColor: CustomColorStyle.white,
                          fontColor: CustomColorStyle.orangePrimary,
                          onPressed: () => CustomNavigation.back(context),
                          label: "Nanti Saja",
                        ),
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                      Expanded(
                        child: CustomButton(
                          onPressed: onPressed,
                          label: "OK",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -150,
              left: 80,
              right: 80,
              bottom: 80,
              child: SvgPicture.asset(
                "assets/images/home/checkin.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
