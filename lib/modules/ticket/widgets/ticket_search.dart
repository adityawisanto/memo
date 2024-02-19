import 'package:memo/packages/packages.dart';

class TicketSearch extends StatelessWidget {
  final TextEditingController search;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  const TicketSearch({
    super.key,
    required this.search,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: search,
      textInputAction: TextInputAction.done,
      cursorColor: CustomColorStyle.orangePrimary,
      style: CustomTextStyle.regular(
        10.sp,
      ),
      decoration: CustomFieldStyle.home(
        "Cari nama merchant, TID, atau no. tiket kamu :)",
        context,
        icon: "assets/images/ticket/search.svg",
        widthIcon: 8.w,
        heightIcon: 8.h,
        onTap: onTap,
      ),
      onChanged: onChanged,
    );
  }
}
