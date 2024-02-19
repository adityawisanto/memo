import 'package:memo/packages/packages.dart';

class CustomBotNav extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int current;
  final int index;
  final String afterIcon;
  final String beforeIcon;
  final String title;

  const CustomBotNav({
    super.key,
    required this.onTap,
    required this.current,
    required this.index,
    required this.afterIcon,
    required this.beforeIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            current == index
                ? SvgPicture.asset(
                    afterIcon,
                  )
                : SvgPicture.asset(
                    beforeIcon,
                  ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              title,
              style: CustomTextStyle.medium(
                10.sp,
                color: current == index
                    ? CustomColorStyle.orangePrimary
                    : CustomColorStyle.blackPrimary.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
