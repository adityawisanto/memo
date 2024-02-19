import 'package:memo/packages/packages.dart';

class CustomTable {
  static TableRow row(
    String title,
    String description, {
    bool? withSemiColon = true,
    GestureTapCallback? onTap,
    bool? withBold = false,
    Color? fontColor,
  }) =>
      TableRow(
        children: [
          Text(
            title,
            style: CustomTextStyle.medium(
              10.sp,
            ),
          ),
          Text(
            withSemiColon == true ? ":" : "",
            style: CustomTextStyle.medium(
              10.sp,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              description,
              style: withBold == false
                  ? CustomTextStyle.medium(
                      10.sp,
                      color: fontColor,
                    )
                  : CustomTextStyle.bold(
                      10.sp,
                      color: fontColor,
                    ),
            ),
          ),
        ],
      );
}
