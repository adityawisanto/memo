import 'package:memo/packages/packages.dart';

class LkmCheckBoxItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const LkmCheckBoxItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: CustomColorStyle.orangePrimary,
        title: Text(
          title,
          style: CustomTextStyle.medium(
            10.sp,
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
