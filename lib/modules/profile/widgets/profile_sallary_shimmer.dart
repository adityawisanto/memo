import 'package:memo/packages/packages.dart';

class ProfileSallaryShimmer extends StatelessWidget {
  const ProfileSallaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmer(
          width: 14.w,
          height: 14.h,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer(
                width: CustomSize.width(context),
                height: 14.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context),
                height: 10.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}
