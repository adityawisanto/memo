import 'package:memo/packages/packages.dart';

class CustomFieldStyle {
  static InputDecoration login(
    BuildContext context,
    String hintText,
    String assetsName, {
    bool? passwordMode,
    bool? visiblePassword,
    VoidCallback? onPressed,
    String? label,
    double? width,
    double? height,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyle.medium(
          12.sp,
          color: CustomColorStyle.white.withOpacity(
            0.4,
          ),
        ),
        label: Text(
          label ?? hintText,
          style: CustomTextStyle.medium(
            12.sp,
            color: CustomColorStyle.white,
          ),
        ),
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
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorStyle.white,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorStyle.white,
          ),
        ),
        errorStyle: CustomTextStyle.medium(
          10.sp,
          color: CustomColorStyle.white,
        ),
        suffixIcon: passwordMode == true
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  visiblePassword == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: CustomColorStyle.white,
                ),
              )
            : null,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: SvgPicture.asset(
            assetsName,
            width: 16.w,
            height: 16.h,
          ),
        ),
      );

  static InputDecoration home(
    String hintText,
    BuildContext context, {
    GestureTapCallback? onTap,
    String? icon,
    double? widthIcon,
    double? heightIcon,
    Color? colorIcon,
  }) =>
      InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: SvgPicture.asset(
            "assets/images/ticket/search.svg",
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.close,
            color: CustomColorStyle.orangePrimary,
            size: 16,
          ),
        ),
        hintStyle: CustomTextStyle.regular(
          10.w,
          color: CustomColorStyle.grayPrimary,
        ),
        filled: true,
        fillColor: CustomColorStyle.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
      );
}
