import 'package:memo/packages/packages.dart';

class SummaryHistoryMenu extends StatefulWidget {
  final List<GlobalKey> keyIntroduction;
  final bool history;
  final TicketBloc ticketBloc;
  final String startDate;
  final String endDate;

  const SummaryHistoryMenu({
    super.key,
    required this.keyIntroduction,
    required this.history,
    required this.ticketBloc,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<SummaryHistoryMenu> createState() => _SummaryHistoryMenuState();
}

class _SummaryHistoryMenuState extends State<SummaryHistoryMenu> {
  var idSelectedStatus = 1;

  int totalTicket = 0;
  int totalInstallationTicket = 0;
  int totalCorrectiveMaintenance = 0;
  int totalDismantle = 0;
  int totalPreventiveMaintenance = 0;
  int totalSupportMaintenance = 0;
  int totalInSla = 0;
  int totalOutSla = 0;
  int totalSla = 0;
  double totalChartInSla = 0;
  double totalChartOutSla = 0;

  List<DataTicket> listDataTicket = [];

  Future<void> getLogicCounting(Ticket ticket) async {
    totalTicket = 0;
    totalInstallationTicket = 0;
    totalCorrectiveMaintenance = 0;
    totalDismantle = 0;
    totalPreventiveMaintenance = 0;
    totalSupportMaintenance = 0;
    totalInSla = 0;
    totalOutSla = 0;
    totalSla = 0;
    totalChartInSla = 0;
    totalChartOutSla = 0;

    if (idSelectedStatus == 1) {
      getHistory(
        ticket,
        idSelectedStatus,
      );
    }

    final listTicketStatistic = ticket.data!
        .where(
          (e) =>
              e.status.toString() == MasterJsonTicket.ttDone ||
              e.status.toString() == MasterJsonTicket.ttDoneNegative,
        )
        .toList();

    totalTicket = listTicketStatistic.length;
    totalInstallationTicket = listTicketStatistic
        .where(
          (e) =>
              e.installType.toString() == MasterJsonTicket.ttImpln ||
              e.installType.toString() == MasterJsonTicket.ttImplr,
        )
        .toList()
        .length;

    totalCorrectiveMaintenance = listTicketStatistic
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttCm,
        )
        .toList()
        .length;

    totalDismantle = listTicketStatistic
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttDist,
        )
        .toList()
        .length;

    totalPreventiveMaintenance = listTicketStatistic
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttPm,
        )
        .toList()
        .length;

    totalSupportMaintenance = listTicketStatistic
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttSm,
        )
        .toList()
        .length;

    totalInSla = listTicketStatistic
        .where(
          (e) => e.sla.toString() == MasterJsonTicket.ttInSla,
        )
        .toList()
        .length;

    totalOutSla = listTicketStatistic
        .where(
          (e) => e.sla.toString() == MasterJsonTicket.ttOutSla,
        )
        .toList()
        .length;

    totalSla = totalInSla + totalOutSla;
    totalChartInSla = totalSla == 0 ? 0 : (totalInSla / totalSla) * 100;
    totalChartOutSla = totalSla == 0 ? 0 : (totalOutSla / totalSla) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.history,
      child: BlocBuilder(
        bloc: widget.ticketBloc,
        builder: (context, state) {
          if (state is TicketLoading) {
            return const SummaryHistoryShimmer();
          } else if (state is TicketGetSuccess) {
            getLogicCounting(state.ticket);
            return Column(
              children: [
                CustomCard(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "TOTAL TIKET\n",
                                    style: CustomTextStyle.bold(
                                      12.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: totalTicket.toString(),
                                    style: CustomTextStyle.bold(
                                      12.sp,
                                      color: CustomColorStyle.orangePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              width: 2,
                              height: CustomSize.height(context) / 8,
                              color: CustomColorStyle.grayPrimary.withOpacity(
                                0.1,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SummaryTicket(
                                    titlePrimary: "Installation",
                                    descriptionPrimary:
                                        totalInstallationTicket.toString(),
                                    titleSecondary: "CM",
                                    descriptionSecondary:
                                        totalCorrectiveMaintenance.toString(),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  SummaryTicket(
                                    titlePrimary: "Dismantel",
                                    descriptionPrimary:
                                        totalDismantle.toString(),
                                    titleSecondary: "PM",
                                    descriptionSecondary:
                                        totalPreventiveMaintenance.toString(),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  SummaryTicket(
                                    titlePrimary: "",
                                    descriptionPrimary: "",
                                    titleSecondary: "SM",
                                    descriptionSecondary:
                                        totalSupportMaintenance.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            SummaryPieItem(
                              key: widget.keyIntroduction[0],
                              category: "IN SLA",
                              valueIn: totalInSla.toDouble(),
                              valueOut: (100 - totalInSla).toDouble(),
                              titleIn: "${totalChartInSla.toInt()}%",
                              titleOut: totalInSla.toString(),
                              color: CustomColorStyle.greenPrimary,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SummaryPieItem(
                              key: widget.keyIntroduction[1],
                              category: "OUT SLA",
                              valueIn: totalOutSla.toDouble(),
                              valueOut: (100 - totalOutSla).toDouble(),
                              titleIn: "${totalChartOutSla.toInt()}%",
                              titleOut: totalOutSla.toString(),
                              color: CustomColorStyle.redPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    ...dataSummaryCategory.map(
                      (e) => Expanded(
                        child: GestureDetector(
                          onTap: () async => setState(() {
                            idSelectedStatus = e.id!;
                            if (idSelectedStatus == 1) {
                              getHistory(
                                state.ticket,
                                idSelectedStatus,
                              );
                            } else if (idSelectedStatus == 3) {
                              getHistory(
                                state.ticket,
                                idSelectedStatus,
                              );
                            } else if (idSelectedStatus == 4) {
                              getHistory(
                                state.ticket,
                                idSelectedStatus,
                              );
                            } else if (idSelectedStatus == 7) {
                              getHistory(
                                state.ticket,
                                idSelectedStatus,
                              );
                            } else if (idSelectedStatus == 5) {
                              getHistory(
                                state.ticket,
                                idSelectedStatus,
                              );
                            }
                          }),
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
                listDataTicket.isEmpty
                    ? CustomHandler.empty()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: listDataTicket.length,
                        itemBuilder: (context, index) {
                          return SummaryHistoryItem(
                            dataTicket: listDataTicket[index],
                          );
                        },
                      )
              ],
            );
          } else if (state is TicketFailure) {
            CustomToast.failure(
              state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> getHistory(
    Ticket ticket,
    int id,
  ) async {
    listDataTicket = ticket.data!
        .where(
          (e) => e.installType == id,
        )
        .toList();
  }
}
