import 'package:memo/packages/packages.dart';

class ProfileDialog extends StatelessWidget {
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapGallery;

  const ProfileDialog({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: CustomColorStyle.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Pilih",
              style: CustomTextStyle.medium(
                12.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onTapCamera,
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: CustomColorStyle.grayPrimary,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Kamera",
                          style: CustomTextStyle.medium(
                            10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onTapGallery,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: CustomColorStyle.grayPrimary,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Galeri",
                          style: CustomTextStyle.medium(
                            10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => CustomNavigation.back(context),
                child: Text(
                  "BATAL",
                  style: CustomTextStyle.medium(
                    10.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
