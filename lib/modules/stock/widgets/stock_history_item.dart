import 'package:memo/packages/packages.dart';

class StockHistoryItem extends StatelessWidget {
  final DataReport dataReport;

  const StockHistoryItem({
    super.key,
    required this.dataReport,
  });

  @override
  Widget build(BuildContext context) {
    final listItem =
        dataReport.reportItem!.where((e) => e.id == dataReport.id).toList();
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: CustomCard(
        elevation: 6,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 8,
              ),
              padding: const EdgeInsets.all(
                16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: CustomColorStyle.orangePrimary,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/ticket/calendar.svg",
                    colorFilter: ColorFilter.mode(
                      CustomColorStyle.white,
                      BlendMode.srcIn,
                    ),
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    CustomDate.formatDate(
                      dataReport.createdAt.toString(),
                      format: "yyyy-MM-dd",
                    ),
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.white,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "|",
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.white,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    "assets/images/ticket/clock.svg",
                    colorFilter: ColorFilter.mode(
                      CustomColorStyle.white,
                      BlendMode.srcIn,
                    ),
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    CustomDate.formatDate(
                      dataReport.createdAt.toString(),
                      format: "HH:mm:ss",
                    ),
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    MasterJsonTicket()
                        .typeWithText(
                          dataReport.installType.toString(),
                        )
                        .toString(),
                    style: CustomTextStyle.bold(
                      10.sp,
                      color: CustomColorStyle.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: CustomTextStyle.bold(
                          12.sp,
                        ),
                      ),
                      Text(
                        dataReport.qty.toString(),
                        style: CustomTextStyle.bold(
                          12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Divider(
                    height: 2,
                    color: CustomColorStyle.grayPrimary.withOpacity(
                      0.4,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: listItem.length,
                    itemBuilder: (context, index) {
                      return StockToolItem(
                        reportItem: listItem[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
