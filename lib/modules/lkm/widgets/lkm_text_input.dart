import 'package:memo/packages/packages.dart';

class LkmTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool? withMultiline;

  const LkmTextInput({
    super.key,
    required this.controller,
    required this.title,
    this.withMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColorStyle.white,
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: withMultiline == true
            ? TextInputType.multiline
            : TextInputType.name,
        cursorColor: CustomColorStyle.orangePrimary,
        maxLines: withMultiline == true ? 8 : null,
        style: CustomTextStyle.medium(
          10.sp,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          alignLabelWithHint: withMultiline,
          label: Text(
            title,
            style: CustomTextStyle.medium(
              10.sp,
              color: CustomColorStyle.grayPrimary.withOpacity(
                0.8,
              ),
            ),
          ),
          hintStyle: CustomTextStyle.medium(
            10.sp,
            color: CustomColorStyle.grayPrimary.withOpacity(
              0.6,
            ),
          ),
        ),
      ),
    );
  }
}
