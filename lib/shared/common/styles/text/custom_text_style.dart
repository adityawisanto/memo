import 'package:memo/packages/packages.dart';

class CustomTextStyle {
  static TextStyle regular(
    double fontSize, {
    Color? color,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) =>
      TextStyle(
        color: color ?? CustomColorStyle.blackPrimary,
        fontFamily: "MonserratRegular",
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );

  static TextStyle medium(
    double fontSize, {
    Color? color,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) =>
      TextStyle(
        color: color ?? CustomColorStyle.blackPrimary,
        fontFamily: "MonserratMedium",
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );

  static TextStyle bold(
    double fontSize, {
    Color? color,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) =>
      TextStyle(
        color: color ?? CustomColorStyle.blackPrimary,
        fontFamily: "MonserratBold",
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );
}
