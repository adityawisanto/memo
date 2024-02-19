import 'package:memo/packages/packages.dart';

class LkmEdcRectracted extends StatelessWidget {
  final String? edcType;
  final void Function(String?)? onChanged;

  const LkmEdcRectracted({
    super.key,
    required this.edcType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColorStyle.white,
      ),
      child: DropdownButtonFormField<String>(
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
          "Pilih EDC",
          style: CustomTextStyle.medium(
            10.sp,
            color: CustomColorStyle.grayPrimary.withOpacity(
              0.8,
            ),
          ),
        ),
        value: edcType,
        items: ["P1-4G", "P2"].map((value) {
          return DropdownMenuItem(
            value: value,
            child: Wrap(
              children: [
                Text(
                  value.toString(),
                  style: CustomTextStyle.medium(
                    10.sp,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: null,
      ),
    );
  }
}
