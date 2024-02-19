import 'package:memo/packages/packages.dart';

class SummaryPage extends StatefulWidget {
  static const routeName = "/summary";

  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final summaryBloc = locator<SummaryBloc>();
  final ticketBloc = locator<TicketBloc>();

  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroductionStatistic = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<GlobalKey> keyIntroductionHistory = [
    GlobalKey(),
    GlobalKey(),
  ];

  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      1,
      0,
      0,
      0,
    ),
    end: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      23,
      59,
      59,
    ),
  );

  String? startDate;
  String? endDate;

  int idSelected = 1;

  bool statistic = true;
  bool history = false;

  @override
  void dispose() {
    summaryBloc.close();
    ticketBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    final now = DateTime.now();
    startDate = CustomDate.formatDate(
      "${DateTime(now.year, now.month, 1, 0, 0, 0)}",
      format: "yyyy-MM-dd HH:mm:ss",
    );
    endDate = CustomDate.formatDate(
      "${DateTime(now.year, now.month, now.day, 23, 59, 59)}",
      format: "yyyy-MM-dd HH:mm:ss",
    );

    summaryBloc.add(
      SummaryStatisticGetted(
        startDate: startDate,
        endDate: endDate,
      ),
    );

    ticketBloc.add(
      TicketGetted(
        type: "history",
        params: "",
        search: "",
        startDate: startDate,
        endDate: endDate,
        dateField: "done_date",
        page: 1,
        limit: 100,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "SUMMARY",
        centerTitle: false,
        automaticallyImplyLeading: false,
        colorText: CustomColorStyle.white,
        colorIcon: CustomColorStyle.white,
        backgroundColor: CustomColorStyle.redPrimary,
        withRange: true,
        onTap: () async {
          DateTimeRange? newDateRange = await showDateRangePicker(
            context: context,
            initialDateRange: dateTimeRange,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: CustomColorStyle.redPrimary,
                    onPrimary: CustomColorStyle.white,
                    onSurface: CustomColorStyle.grayPrimary,
                    secondary: CustomColorStyle.redPrimary.withOpacity(
                      0.1,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );

          if (newDateRange == null) return;

          setState(() {
            dateTimeRange = newDateRange;

            final start = CustomDate.formatDate(
              dateTimeRange.start.toString(),
              format: "yyyy-MM-dd",
            );

            final end = CustomDate.formatDate(
              dateTimeRange.end.toString(),
              format: "yyyy-MM-dd",
            );

            if (idSelected == 1) {
              summaryBloc.add(
                SummaryStatisticGetted(
                  startDate: "$start 00:00:00",
                  endDate: "$end 23:59:59",
                ),
              );
            } else if (idSelected == 2) {
              ticketBloc.add(
                TicketGetted(
                  type: "history",
                  params: "",
                  search: "",
                  startDate: "$start 00:00:00",
                  endDate: "$end 23:59:59",
                  dateField: "done_date",
                  page: 1,
                  limit: 100,
                ),
              );
            }
          });
        },
        startDate: CustomDate.formatDate(
          dateTimeRange.start.toString(),
          format: "dd MMM yy",
        ),
        endDate: CustomDate.formatDate(
          dateTimeRange.end.toString(),
          format: "dd MMM yy",
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColorStyle.orangePrimary.withOpacity(
                  0.2,
                ),
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: CustomColorStyle.white,
            ),
            height: CustomSize.height(context) / 24,
            child: Row(
              children: [
                CustomTab(
                  key: keyIntroductionStatistic[0],
                  onTap: () => setState(() {
                    idSelected = 1;
                    statistic = true;
                    history = false;
                  }),
                  idSelected: idSelected,
                  index: 2,
                  title: "STATISTIK",
                ),
                CustomTab(
                  key: keyIntroductionStatistic[1],
                  onTap: () => setState(() {
                    idSelected = 2;
                    statistic = false;
                    history = true;
                    checkIntroSummaryHistory(
                      keyIntroductionHistory,
                      context,
                      customPreferences,
                    );
                  }),
                  idSelected: idSelected,
                  index: 1,
                  title: "HISTORY",
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: Column(
                  children: [
                    SummaryStatisticMenu(
                      keyIntroduction: keyIntroductionStatistic,
                      statistic: statistic,
                      summaryBloc: summaryBloc,
                      startDate: startDate.toString(),
                      endDate: endDate.toString(),
                    ),
                    SummaryHistoryMenu(
                      keyIntroduction: keyIntroductionHistory,
                      history: history,
                      ticketBloc: ticketBloc,
                      startDate: startDate.toString(),
                      endDate: endDate.toString(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
