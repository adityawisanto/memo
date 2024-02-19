import 'package:memo/packages/packages.dart';

class HomeToast extends StatelessWidget {
  const HomeToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24,
        ),
        color: CustomColorStyle.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: CustomColorStyle.greenPrimary,
            child: Icon(
              Icons.check,
              color: CustomColorStyle.white,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Check-in Sukses",
                  style: CustomTextStyle.bold(
                    12.sp,
                    color: CustomColorStyle.greenPrimary,
                  ),
                ),
                Text(
                  "Mulailah hari kerjamu dengan semangat dan jangan lupa berdoa!",
                  style: CustomTextStyle.medium(
                    12.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
