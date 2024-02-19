import 'package:memo/packages/packages.dart';

class LkmClockItem extends StatelessWidget {
  final TextEditingController clock;
  final String title;
  final GestureTapCallback? onTap;

  const LkmClockItem({
    super.key,
    required this.clock,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: CustomColorStyle.white,
        ),
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: TextFormField(
          controller: clock,
          readOnly: true,
          style: CustomTextStyle.medium(
            12.sp,
          ),
          onTap: onTap,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
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
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
