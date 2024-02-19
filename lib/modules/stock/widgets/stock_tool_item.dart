import 'package:memo/packages/packages.dart';

class StockToolItem extends StatelessWidget {
  final ReportItem reportItem;

  const StockToolItem({
    super.key,
    required this.reportItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Row(
        children: [
          Text(
            reportItem.qty.toString(),
            style: CustomTextStyle.regular(
              12.sp,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            "x",
            style: CustomTextStyle.regular(
              12.sp,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            padding: const EdgeInsets.all(
              6,
            ),
            margin: const EdgeInsets.only(
              right: 8,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColorStyle.orangePrimary,
            ),
            child: reportItem.sn != ""
                ? Image.asset(
                    "assets/images/warehouse/${reportItem.name == "P1" ? "edc_p1.png" : "edc_p2.png"}",
                    width: 16.w,
                    height: 16.h,
                  )
                : SvgPicture.asset(
                    MasterJsonWarehouse()
                        .typeWithImage(reportItem.name.toString())
                        .toString(),
                    colorFilter: ColorFilter.mode(
                      CustomColorStyle.white,
                      BlendMode.srcIn,
                    ),
                    width: 14.w,
                    height: 14.h,
                  ),
          ),
          Expanded(
            child: Text(
              reportItem.sn != ""
                  ? "EDC ${reportItem.name} ${reportItem.sn}"
                  : reportItem.name.toString(),
              style: CustomTextStyle.medium(
                10.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
