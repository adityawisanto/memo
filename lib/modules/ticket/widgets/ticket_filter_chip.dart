import 'package:memo/packages/packages.dart';

class TicketFilterChip extends StatelessWidget {
  final String title;
  final List<String> selectedChip;
  final void Function(bool)? onSelected;

  const TicketFilterChip({
    super.key,
    required this.title,
    required this.selectedChip,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        title,
        style: CustomTextStyle.regular(
          10.sp,
          color: selectedChip.contains(
            title,
          )
              ? CustomColorStyle.white
              : CustomColorStyle.grayPrimary,
        ),
      ),
      showCheckmark: false,
      backgroundColor: CustomColorStyle.white,
      selectedColor: CustomColorStyle.orangePrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: CustomColorStyle.orangePrimary,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      selected: selectedChip.contains(title),
      onSelected: onSelected,
    );
  }
}
