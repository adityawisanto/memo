import 'package:memo/packages/packages.dart';

class LkmTypeMerchant extends StatelessWidget {
  final MasterDropdownLkmMerchant? merchantType;
  final void Function(MasterDropdownLkmMerchant?)? onChanged;

  const LkmTypeMerchant({
    super.key,
    required this.merchantType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColorStyle.white,
      ),
      child: DropdownButtonFormField<MasterDropdownLkmMerchant>(
        isExpanded: true,
        dropdownColor: CustomColorStyle.white,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColorStyle.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColorStyle.white,
            ),
          ),
        ),
        hint: Text(
          "Tipe merchant",
          style: CustomTextStyle.medium(
            10.sp,
            color: CustomColorStyle.grayPrimary.withOpacity(
              0.8,
            ),
          ),
        ),
        value: merchantType,
        items: dataMasterDropdownLkmMerchant.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Wrap(
              children: [
                Text(
                  value.title.toString(),
                  style: CustomTextStyle.medium(
                    10.sp,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
