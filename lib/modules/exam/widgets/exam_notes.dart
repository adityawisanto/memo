import 'package:memo/packages/packages.dart';

class ExamNotes extends StatelessWidget {
  const ExamNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catatan :",
          style: CustomTextStyle.bold(
            10.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "- Pastikan untuk ",
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
              TextSpan(
                text: "memeriksa hasil kerjamu ",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.redPrimary,
                ),
              ),
              TextSpan(
                text: "\nsebelum mengirimnya",
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "- Ingat, kamu hanya memiliki ",
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
              TextSpan(
                text: "satu kesempatan ",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.redPrimary,
                ),
              ),
              TextSpan(
                text: "\nuntuk mengirim jawabanmu",
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
