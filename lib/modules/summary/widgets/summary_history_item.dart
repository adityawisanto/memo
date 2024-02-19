import 'package:memo/packages/packages.dart';

class SummaryHistoryItem extends StatelessWidget {
  final DataTicket dataTicket;

  const SummaryHistoryItem({
    super.key,
    required this.dataTicket,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      withBorder: true,
      withRipple: true,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dataTicket.tid.toString(),
                    style: CustomTextStyle.bold(
                      14.sp,
                      color: CustomColorStyle.orangePrimary,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        color: CustomColorStyle.greenPrimary,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/home/ticket_off.svg",
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
                            MasterJsonTicket()
                                .statusWithText(
                                  dataTicket.status.toString(),
                                )
                                .toString(),
                            style: CustomTextStyle.bold(
                              8.sp,
                              color: CustomColorStyle.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            width: 4.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColorStyle.white,
                            ),
                          ),
                          Text(
                            dataTicket.idSubTicket.toString(),
                            style: CustomTextStyle.bold(
                              8.sp,
                              color: CustomColorStyle.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    dataTicket.sla == MasterJsonTicket.ttOutSla
                        ? SvgPicture.asset(
                            "assets/images/summary/out_timer.svg",
                          )
                        : SvgPicture.asset(
                            "assets/images/summary/in_timer.svg",
                          ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    dataTicket.merchantName.toString(),
                    style: CustomTextStyle.regular(
                      10.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/summary/doc.svg",
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      CustomDate.formatDate(
                        dataTicket.doneDate.toString(),
                        format: "yyyy-MM-dd",
                      ),
                      style: CustomTextStyle.regular(
                        10.sp,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
