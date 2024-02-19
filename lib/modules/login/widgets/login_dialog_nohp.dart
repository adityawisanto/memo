import 'package:memo/packages/packages.dart';

class LoginDialogNoHp extends StatelessWidget {
  const LoginDialogNoHp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              color: CustomColorStyle.orangePrimary,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "No Hp tidak sesuai",
              style: CustomTextStyle.bold(
                12.sp,
              ),
            ),
            Text(
              "Harap login kembali",
              style: CustomTextStyle.medium(
                10.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ElevatedButton(
              onPressed: () => CustomNavigation.back(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColorStyle.orangePrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
              child: Text(
                "OK",
                style: CustomTextStyle.bold(
                  12.sp,
                  color: CustomColorStyle.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
