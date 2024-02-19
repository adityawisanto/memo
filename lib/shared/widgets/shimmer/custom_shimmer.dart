import 'package:memo/packages/packages.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final bool? withCircle;
  final double? borderRadius;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.withCircle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColorStyle.blackPrimary.withOpacity(0.1),
      highlightColor: CustomColorStyle.grayPrimary.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: withCircle == true
            ? BoxDecoration(
                color: CustomColorStyle.grayPrimary,
                shape: BoxShape.circle,
              )
            : BoxDecoration(
                color: CustomColorStyle.grayPrimary,
                borderRadius: BorderRadius.circular(
                  borderRadius ?? 4,
                ),
              ),
      ),
    );
  }
}
