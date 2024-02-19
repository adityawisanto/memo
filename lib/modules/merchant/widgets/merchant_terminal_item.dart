import 'package:memo/packages/packages.dart';

class MerchantTerminalItem extends StatelessWidget {
  final String title;
  final String description;

  const MerchantTerminalItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.bold(
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
}
