import 'package:memo/packages/packages.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? fontColor;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.label,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CustomSize.width(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? CustomColorStyle.orangePrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        child: Text(
          label,
          style: CustomTextStyle.bold(
            fontSize ?? 10.sp,
            color: fontColor ?? CustomColorStyle.white,
          ),
        ),
      ),
    );
  }
}
