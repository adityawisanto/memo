import 'package:memo/packages/packages.dart';

class CustomDialog {
  Future<void> information(
    String title,
    String description, {
    String? no,
    String? yes,
    bool? withNetral = false,
    Color? backgroundNegative,
    Color? colorTextNegative,
    Color? backgroundPositive,
    Color? colorTextPositive,
    void Function()? negative,
    void Function()? positive,
    bool? reverse = false,
  }) async {
    return showDialog(
      context: CustomNavigator.navigatorKey.currentContext!,
      builder: (context) {
        FocusScope.of(context).unfocus();
        return Dialog(
          elevation: 0,
          backgroundColor: CustomColorStyle.white,
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
                  size: 50,
                  color: CustomColorStyle.orangePrimary,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  title,
                  style: CustomTextStyle.bold(
                    12.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  description,
                  style: CustomTextStyle.medium(
                    12.sp,
                    color: CustomColorStyle.grayPrimary,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                withNetral == false
                    ? reverse == false
                        ? Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  backgroundColor: backgroundNegative,
                                  fontColor: colorTextNegative,
                                  onPressed: negative,
                                  label: no.toString(),
                                ),
                              ),
                              SizedBox(
                                width: 16.h,
                              ),
                              Expanded(
                                child: CustomButton(
                                  backgroundColor: backgroundPositive ??
                                      CustomColorStyle.orangePrimary,
                                  fontColor: colorTextPositive ??
                                      CustomColorStyle.white,
                                  onPressed: positive,
                                  label: yes.toString(),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  backgroundColor: backgroundPositive ??
                                      CustomColorStyle.orangePrimary,
                                  fontColor: colorTextPositive ??
                                      CustomColorStyle.white,
                                  onPressed: positive,
                                  label: yes.toString(),
                                ),
                              ),
                              SizedBox(
                                width: 16.h,
                              ),
                              Expanded(
                                child: CustomButton(
                                  backgroundColor: backgroundNegative,
                                  fontColor: colorTextNegative,
                                  onPressed: negative,
                                  label: no.toString(),
                                ),
                              ),
                            ],
                          )
                    : CustomButton(
                        onPressed: negative,
                        label: no.toString(),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> loading(
    String title,
  ) {
    return showDialog(
      context: CustomNavigator.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        FocusScope.of(context).unfocus();
        return Dialog(
          elevation: 0,
          backgroundColor: CustomColorStyle.white,
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
                Image.asset(
                  "assets/images/splash/meri.png",
                  width: 70.w,
                  height: 70.h,
                ),
                Text(
                  title,
                  style: CustomTextStyle.medium(
                    10.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> success(
    String title,
    String description,
  ) {
    return showDialog(
      context: CustomNavigator.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        FocusScope.of(context).unfocus();
        return Dialog(
          elevation: 0,
          backgroundColor: CustomColorStyle.white,
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
                  Icons.check,
                  size: 50,
                  color: CustomColorStyle.greenPrimary,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  title,
                  style: CustomTextStyle.medium(
                    12.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  description,
                  style: CustomTextStyle.medium(
                    12.sp,
                    color: CustomColorStyle.grayPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
