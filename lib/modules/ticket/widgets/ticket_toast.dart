import 'package:memo/packages/packages.dart';

class TicketToast extends StatelessWidget {
  final String title;

  const TicketToast({
    super.key,
    required this.title,
  });

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
          Icon(
            Icons.push_pin,
            color: CustomColorStyle.orangePrimary,
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Text(
              "Tiket telah di ${title == "true" ? "pin" : "unpin"}",
              style: CustomTextStyle.medium(
                12.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
