import 'package:memo/packages/packages.dart';

Column targetContent(
  BuildContext context,
  String title,
  String description,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: CustomTextStyle.bold(
          14.sp,
          color: CustomColorStyle.white,
        ),
      ),
      SizedBox(
        height: 4.h,
      ),
      Text(
        description,
        style: CustomTextStyle.medium(
          12.sp,
          color: CustomColorStyle.white,
        ),
      ),
    ],
  );
}
