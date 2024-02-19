import 'package:memo/packages/packages.dart';

class CustomCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? withBorder;
  final bool? withRipple;
  final Widget child;
  final double? elevation;

  const CustomCard({
    super.key,
    this.onTap,
    this.withBorder,
    required this.child,
    this.withRipple,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColorStyle.white,
      surfaceTintColor: CustomColorStyle.white,
      shadowColor: CustomColorStyle.blackPrimary.withOpacity(
        0.1,
      ),
      shape: RoundedRectangleBorder(
        side: withBorder == true
            ? BorderSide(
                color: CustomColorStyle.orangePrimary.withOpacity(
                  0.2,
                ),
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      elevation: elevation ?? 6,
      child: withRipple == true
          ? InkWell(
              borderRadius: BorderRadius.circular(
                8,
              ),
              onTap: onTap,
              child: child,
            )
          : child,
    );
  }
}
