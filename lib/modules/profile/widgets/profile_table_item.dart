import 'package:memo/packages/packages.dart';

class ProfileTableItem {
  static TableRow tableRow(
    String title,
    String description,
  ) =>
      TableRow(
        children: [
          Text(
            title,
            style: CustomTextStyle.medium(
              10.sp,
            ),
          ),
          Text(
            ":",
            style: CustomTextStyle.medium(
              10.sp,
            ),
          ),
          Text(
            description,
            style: CustomTextStyle.medium(
              10.sp,
            ),
          ),
        ],
      );
}
