import 'package:memo/packages/packages.dart';

class SummaryStatisticMenu extends StatefulWidget {
  final List<GlobalKey> keyIntroduction;
  final bool statistic;
  final SummaryBloc summaryBloc;
  final String startDate;
  final String endDate;

  const SummaryStatisticMenu({
    super.key,
    required this.keyIntroduction,
    required this.statistic,
    required this.summaryBloc,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<SummaryStatisticMenu> createState() => _SummaryStatisticMenuState();
}

class _SummaryStatisticMenuState extends State<SummaryStatisticMenu> {
  final customPreferences = locator<CustomPreferences>();

  int totalTicket = 0;
  int totalInstallationTicket = 0;
  int totalCm = 0;
  int totalDismantle = 0;
  int totalPm = 0;
  int totalSm = 0;

  int done = 0;
  int doneNegative = 0;
  int stat = 0;
  int totalStat = 0;
  double percentageStat = 0;

  var idSelectedStatus = 1;

  List<SummaryChart>? listChartBar = [];

  List<SummaryDataStatistic>? listInstallationTicket;
  List<SummaryDataStatistic>? listCorrectMaintenance;
  List<SummaryDataStatistic>? listDismantle;
  List<SummaryDataStatistic>? listPreventiveMaintenance;
  List<SummaryDataStatistic>? listSupportMaintenance;

  Future<void> getLogicCounting(SummaryStatistic summaryStatistic) async {
    totalTicket = 0;
    totalInstallationTicket = 0;
    totalCm = 0;
    totalDismantle = 0;
    totalPm = 0;
    totalSm = 0;

    done = 0;
    doneNegative = 0;
    stat = 0;
    totalStat = 0;
    percentageStat = 0;

    for (var item in summaryStatistic.data!) {
      totalTicket += item.total!;
    }

    listInstallationTicket = summaryStatistic.data!
        .where(
          (e) =>
              e.installType.toString() == MasterJsonTicket.ttImpln ||
              e.installType.toString() == MasterJsonTicket.ttImplr,
        )
        .toList();

    for (var item in listInstallationTicket!) {
      totalInstallationTicket += item.total!;
    }

    if (idSelectedStatus == 1) {
      getChartBar(
        listInstallationTicket!,
        "1",
      );
    }

    listCorrectMaintenance = summaryStatistic.data!
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttCm,
        )
        .toList();

    for (var item in listCorrectMaintenance!) {
      totalCm += item.total!;
    }

    listDismantle = summaryStatistic.data!
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttDist,
        )
        .toList();

    for (var item in listDismantle!) {
      totalDismantle += item.total!;
    }

    listPreventiveMaintenance = summaryStatistic.data!
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttPm,
        )
        .toList();

    for (var item in listPreventiveMaintenance!) {
      totalPm += item.total!;
    }

    listSupportMaintenance = summaryStatistic.data!
        .where(
          (e) => e.installType.toString() == MasterJsonTicket.ttSm,
        )
        .toList();

    for (var item in listSupportMaintenance!) {
      totalSm += item.total!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.statistic,
      child: BlocBuilder(
        bloc: widget.summaryBloc,
        builder: (context, state) {
          if (state is SummaryLoading) {
            return const SummaryStatisticShimmer();
          } else if (state is SummaryStatisticGetSuccess) {
            checkIntroSummaryStatistic(
              widget.keyIntroduction,
              context,
              customPreferences,
            );
            getLogicCounting(state.summaryStatistic);
            return Column(
              children: [
                Text(
                  "*data yang tampil dibawah ini menggunakan range tanggal tiket dibuat",
                  style: CustomTextStyle.medium(
                    10.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomCard(
                  key: widget.keyIntroduction[2],
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
                                    descriptionSecondary: totalCm.toString(),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  SummaryTicket(
                                    titlePrimary: "Dismantel",
                                    descriptionPrimary:
                                        totalDismantle.toString(),
                                    titleSecondary: "PM",
                                    descriptionSecondary: totalPm.toString(),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  SummaryTicket(
                                    titlePrimary: "",
                                    descriptionPrimary: "",
                                    titleSecondary: "SM",
                                    descriptionSecondary: totalSm.toString(),
                                  ),
                                ],
                              ),
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
                SummaryLineTab(
                  key: widget.keyIntroduction[3],
                  onTap: (e) async => setState(() {
                    idSelectedStatus = e;
                    if (idSelectedStatus == 1) {
                      getChartBar(
                        listInstallationTicket!,
                        idSelectedStatus.toString(),
                      );
                    } else if (idSelectedStatus == 3) {
                      getChartBar(
                        listCorrectMaintenance!,
                        idSelectedStatus.toString(),
                      );
                    } else if (idSelectedStatus == 4) {
                      getChartBar(
                        listPreventiveMaintenance!,
                        idSelectedStatus.toString(),
                      );
                    } else if (idSelectedStatus == 7) {
                      getChartBar(
                        listSupportMaintenance!,
                        idSelectedStatus.toString(),
                      );
                    } else if (idSelectedStatus == 5) {
                      getChartBar(
                        listDismantle!,
                        idSelectedStatus.toString(),
                      );
                    }
                  }),
                  idSelectedStatus: idSelectedStatus,
                ),
                SummaryChartBarItem(
                  stat: stat,
                  totalStat: totalStat,
                  percentageStat: percentageStat,
                  listChartBar: listChartBar!,
                ),
              ],
            );
          } else if (state is SummaryFailure) {
            CustomToast.failure(
              state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> getChartBar(
    List<SummaryDataStatistic> listDataStatic,
    String title,
  ) async {
    listChartBar!.clear();

    int totalDone = 0;
    int totalDn = 0;
    int totalOnProgress = 0;
    int totalPending = 0;
    int totalStat = 0;

    final listDoneNegative = listInstallationTicket!
        .where(
          (e) => e.idStatusTicket.toString() == MasterJsonTicket.ttDoneNegative,
        )
        .toList();

    for (var item in listDoneNegative) {
      doneNegative += item.total!;
    }

    final listDn = listDataStatic
        .where(
          (e) => e.idStatusTicket.toString() == MasterJsonTicket.ttDoneNegative,
        )
        .toList();

    for (var item in listDn) {
      totalDn += item.total!;
    }

    final listDone = listDataStatic
        .where(
          (e) => e.idStatusTicket.toString() == MasterJsonTicket.ttDone,
        )
        .toList();

    for (var item in listDone) {
      totalDone += item.total!;
    }

    final listTotalStat = (title == MasterJsonTicket.ttImpln)
        ? listDataStatic.where((e) =>
            e.installType.toString() == MasterJsonTicket.ttImpln ||
            e.installType.toString() == MasterJsonTicket.ttImplr)
        : listDataStatic
            .where((e) => e.installType.toString() == title)
            .toList();

    for (var item in listTotalStat) {
      totalStat += item.total!;
    }

    stat = done + doneNegative;
    percentageStat = (stat / totalStat) * 100;

    final listOnProgress = listDataStatic
        .where(
          (e) => e.idStatusTicket.toString() == MasterJsonTicket.ttOnProgress,
        )
        .toList();

    for (var item in listOnProgress) {
      totalOnProgress += item.total!;
    }

    final listPending = listDataStatic
        .where(
          (e) => e.idStatusTicket.toString() == MasterJsonTicket.ttPending,
        )
        .toList();

    for (var item in listPending) {
      totalPending += item.total!;
    }

    List<SummaryChart> listChart = [
      SummaryChart(
        id: 1,
        title: "Done",
        total: totalDone,
      ),
      SummaryChart(
        id: 2,
        title: "DN",
        total: totalDn,
      ),
      SummaryChart(
        id: 3,
        title: "On Progress",
        total: totalOnProgress,
      ),
      SummaryChart(
        id: 4,
        title: "Pending",
        total: totalPending,
      ),
    ];

    listChartBar = listChart;
  }
}
