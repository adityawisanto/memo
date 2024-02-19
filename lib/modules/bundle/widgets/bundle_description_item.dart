import 'package:memo/packages/packages.dart';

class BundleDescriptionItem extends StatelessWidget {
  final String title;
  final String description;

  const BundleDescriptionItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: CustomTextStyle.medium(
                10.sp,
                color: CustomColorStyle.grayPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: CustomTextStyle.medium(
                10.sp,
                color: CustomColorStyle.grayPrimary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
