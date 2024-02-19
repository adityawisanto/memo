import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memo/packages/packages.dart';

class TicketItem extends StatelessWidget {
  final DataTicket dataTicket;
  final TicketBloc pinnedBloc;

  const TicketItem({
    super.key,
    required this.dataTicket,
    required this.pinnedBloc,
  });

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.parse(dataTicket.deadline.toString());
    return Slidable(
      key: ValueKey(
        dataTicket.id,
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            pinnedBloc.add(
              TicketSubmitted(
                idTicket: dataTicket.id,
              ),
            );
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              pinnedBloc.add(
                TicketSubmitted(
                  idTicket: dataTicket.id,
                ),
              );
            },
            backgroundColor: CustomColorStyle.orangePrimary,
            foregroundColor: CustomColorStyle.white,
            icon: dataTicket.pinned.toString() == "true"
                ? Icons.push_pin_outlined
                : Icons.push_pin,
          ),
        ],
      ),
      child: CustomCard(
        withBorder: true,
        withRipple: true,
        onTap: () => CustomNavigation.intentWithData(
          context,
          MerchantPage.routeName,
          MerchantArgument(
            dataTicket: dataTicket,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      MasterJsonTicket()
                          .typeWithText(
                            dataTicket.installType.toString(),
                          )
                          .toString(),
                      style: CustomTextStyle.medium(
                        10.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        MasterJsonTicket().priorityWithIcon(
                          dataTicket.priority.toString(),
                        ),
                        color: CustomColorStyle.blackPrimary,
                        size: 20,
                      ),
                      Text(
                        MasterJsonTicket()
                            .priorityWithText(
                              dataTicket.priority.toString(),
                            )
                            .toString(),
                        style: CustomTextStyle.medium(
                          10.sp,
                        ),
                      ),
                      dataTicket.pinned.toString() == "true"
                          ? SizedBox(
                              width: 8.w,
                            )
                          : const SizedBox.shrink(),
                      dataTicket.pinned.toString() == "true"
                          ? Icon(
                              Icons.push_pin,
                              color: CustomColorStyle.orangePrimary,
                              size: 14,
                            )
                          : const SizedBox.shrink(),
                    ],
                  )
                ],
              ),
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
                  SvgPicture.asset(
                    "assets/images/ticket/calendar.svg",
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    CustomDate.formatDate(
                      dataTicket.deadline.toString(),
                      format: "yyyy-MM-dd",
                    ),
                    style: CustomTextStyle.regular(
                      10.sp,
                      color: CustomColorStyle.blackPrimary,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "|",
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.grayPrimary.withOpacity(
                        0.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    "assets/images/ticket/clock.svg",
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    endDate.isBefore(startDate)
                        ? "OUT SLA"
                        : CustomDate.getFormattedDifference(
                            startDate,
                            endDate,
                          ),
                    style: endDate.isBefore(startDate)
                        ? CustomTextStyle.bold(
                            10.sp,
                            color: CustomColorStyle.redPrimary,
                          )
                        : CustomTextStyle.regular(
                            10.sp,
                            color: CustomColorStyle.blackPrimary,
                          ),
                  ),
                ],
              ),
              Text(
                dataTicket.merchantName.toString(),
                style: CustomTextStyle.medium(
                  10.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                dataTicket.address.toString(),
                style: CustomTextStyle.medium(
                  8.sp,
                  color: CustomColorStyle.grayPrimary,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: MasterJsonTicket().statusWithColor(
                        dataTicket.status.toString(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/home/ticket_off.svg",
                            colorFilter: ColorFilter.mode(
                              CustomColorStyle.white,
                              BlendMode.srcIn,
                            ),
                            width: 10.w,
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 6.w,
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
                            width: 2.4.w,
                            height: 2.4.h,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
