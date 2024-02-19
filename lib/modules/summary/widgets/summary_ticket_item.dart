import 'package:memo/packages/packages.dart';

class SummaryTicketItem extends StatelessWidget {
  final String title;
  final String description;

  const SummaryTicketItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title\n",
            style: CustomTextStyle.bold(
              10.sp,
            ),
          ),
          TextSpan(
            text: description,
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
