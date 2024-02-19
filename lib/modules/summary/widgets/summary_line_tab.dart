import 'package:memo/packages/packages.dart';

class SummaryLineTab extends StatelessWidget {
  final void Function(int)? onTap;
  final int idSelectedStatus;

  const SummaryLineTab({
    super.key,
    required this.onTap,
    required this.idSelectedStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ...dataSummaryCategory.map(
              (e) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTap!(e.id!);
                  },
                  child: Text(
                    e.label.toString(),
                    style: idSelectedStatus == e.id!
                        ? CustomTextStyle.bold(
                            8.sp,
                          )
                        : CustomTextStyle.regular(
                            8.sp,
                          ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: CustomColorStyle.white,
          ),
          height: CustomSize.height(context) / 180,
          child: Row(
            children: [
              ...dataSummaryCategory.map(
                (e) => Expanded(
                  child: Container(
                    height: CustomSize.height(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      color: idSelectedStatus == e.id
                          ? CustomColorStyle.orangePrimary
                          : CustomColorStyle.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
