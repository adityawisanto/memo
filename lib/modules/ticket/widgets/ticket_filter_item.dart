import 'package:memo/packages/packages.dart';

class TicketFilterItem extends StatelessWidget {
  final List<String> defaultChip;
  final List<String> selectedChip;
  final int index;
  final String Function(String) getFilterCount;
  final void Function(bool)? onSelected;

  const TicketFilterItem({
    super.key,
    required this.defaultChip,
    required this.selectedChip,
    required this.index,
    required this.getFilterCount,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: ChoiceChip(
        selectedColor: CustomColorStyle.orangePrimary,
        backgroundColor: CustomColorStyle.baseLayout,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: CustomColorStyle.orangePrimary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        showCheckmark: false,
        label: Row(
          children: [
            Text(
              defaultChip[index],
              style: CustomTextStyle.medium(
                10.sp,
                color: selectedChip.contains(
                  defaultChip[index],
                )
                    ? CustomColorStyle.white
                    : CustomColorStyle.orangePrimary,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              getFilterCount(
                defaultChip[index],
              ),
              style: CustomTextStyle.bold(
                10.sp,
                color: selectedChip.contains(
                  defaultChip[index],
                )
                    ? CustomColorStyle.white
                    : CustomColorStyle.orangePrimary,
              ),
            ),
          ],
        ),
        selected: selectedChip.contains(
          defaultChip[index],
        ),
        onSelected: onSelected,
      ),
    );
  }
}
