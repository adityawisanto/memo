import 'package:memo/packages/packages.dart';

class LkmSn extends StatelessWidget {
  final TextEditingController sn;
  final bool? readOnly;

  const LkmSn({
    super.key,
    required this.sn,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
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
        controller: sn,
        cursorColor: CustomColorStyle.orangePrimary,
        style: CustomTextStyle.medium(
          10.sp,
        ),
        readOnly: readOnly!,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Input SN",
          label: Text(
            "Input SN",
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
