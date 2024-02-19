import 'package:memo/packages/packages.dart';

class CourseLearningItem extends StatelessWidget {
  final String title;
  final String url;
  final String description;

  const CourseLearningItem({
    super.key,
    required this.title,
    required this.url,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              CustomColorStyle.redPrimary,
              CustomColorStyle.redSecondary,
            ],
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.medium(
                12.sp,
                color: CustomColorStyle.white,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  url,
                ),
                const Spacer(),
                Text(
                  description,
                  style: CustomTextStyle.bold(
                    14.sp,
                    color: CustomColorStyle.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
