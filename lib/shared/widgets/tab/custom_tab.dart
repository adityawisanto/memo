import 'package:memo/packages/packages.dart';

class CustomTab extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int idSelected;
  final int index;
  final String title;

  const CustomTab({
    super.key,
    required this.onTap,
    required this.idSelected,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: CustomSize.width(context),
          height: CustomSize.height(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: idSelected == index
                ? CustomColorStyle.white
                : CustomColorStyle.orangePrimary,
          ),
          child: Center(
            child: Text(
              title,
              style: CustomTextStyle.medium(
                10.sp,
                color: idSelected == index
                    ? CustomColorStyle.orangePrimary
                    : CustomColorStyle.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
