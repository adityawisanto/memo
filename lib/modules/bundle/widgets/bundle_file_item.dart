import 'package:memo/packages/packages.dart';

class BundleFileItem extends StatelessWidget {
  final String title;
  final String image;

  const BundleFileItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(
          base64.decode(
            image.split(',').last,
          ),
          width: CustomSize.width(context),
          height: CustomSize.height(context) / 4,
          errorBuilder: (context, error, stackTrace) => SizedBox(
            width: CustomSize.width(context),
            height: CustomSize.height(context) / 4,
            child: Center(
              child: Text(
                "Tidak Tersedia",
                style: CustomTextStyle.medium(
                  10.sp,
                  color: CustomColorStyle.grayPrimary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          title,
          style: CustomTextStyle.medium(
            12.sp,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
