import 'package:memo/packages/packages.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      dropdownColor: CustomColorStyle.white,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorStyle.transparent,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorStyle.transparent,
          ),
        ),
      ),
      hint: Center(
        child: Text(
          hint,
          style: CustomTextStyle.medium(
            10.sp,
          ),
        ),
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
