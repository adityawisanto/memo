import 'package:memo/packages/packages.dart';

class BundleTitleItem extends StatelessWidget {
  final String title;
  final String? description;

  const BundleTitleItem({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        bottom: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyle.medium(
              12.sp,
            ),
          ),
          Text(
            description ?? "Status",
            style: CustomTextStyle.medium(
              12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
