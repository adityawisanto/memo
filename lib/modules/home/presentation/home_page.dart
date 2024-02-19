import 'package:memo/packages/packages.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final checkinBloc = locator<CheckBloc>();
  final checkoutBloc = locator<CheckBloc>();
  final customPreferences = locator<CustomPreferences>();

  int currentIndex = 0;

  bool lock = true;

  FToast fToast = FToast();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Future<void> getWorkManager() async {
    await CustomWork.init();
  }

  Future<void> saveChecked(
    bool checked, {
    int? interval,
    int? hb,
    int? notif,
    int? lkm,
  }) async {
    await customPreferences.saveCheck(!checked);

    setState(() {
      lock = !lock;
    });
    if (!checked) {
      await customPreferences.saveWork(interval ?? 0);
      await customPreferences.saveHb(hb ?? 0);
      await customPreferences.saveNotif(notif ?? 0);
      await customPreferences.saveLkm(lkm ?? 0);
    }
  }

  Future<void> getChecked() async {
    final check = await customPreferences.getCheck();
    setState(() {
      lock = !check;
    });

    await getWorkManager();
  }

  @override
  void dispose() {
    checkinBloc.close();
    checkoutBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    fToast.init(context);

    getChecked();

    checkIntroHome(
      keyIntroduction,
      context,
      customPreferences,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: checkinBloc,
          listener: (context, state) {
            if (state is CheckLoading) {
              CustomNavigation.back(context);
              CustomDialog().loading(
                "Proses Checkin...",
              );
            } else if (state is CheckinPostSuccess) {
              fToast.showToast(
                child: const HomeToast(),
                gravity: ToastGravity.TOP,
                toastDuration: const Duration(
                  seconds: 2,
                ),
              );
              CustomNavigation.back(context);
              setState(() {
                saveChecked(
                  !lock,
                  interval: state.checkin.settings!.interval,
                  hb: state.checkin.settings!.hbInterval,
                  notif: state.checkin.settings!.notifInterval,
                  lkm: state.checkin.settings!.lkmInterval,
                );
              });
            } else if (state is CheckFailure) {
              CustomToast.failure(
                state.message,
              );
            }
          },
        ),
        BlocListener(
          bloc: checkoutBloc,
          listener: (context, state) {
            if (state is CheckLoading) {
              CustomNavigation.back(context);
              CustomDialog().loading(
                "Proses Checkout...",
              );
            } else if (state is CheckoutPostSuccess) {
              CustomNavigation.back(context);
              showDialog(
                context: context,
                builder: (context) {
                  return HomeTicketDone(
                    totalTicket: state.checkout.data ?? 0,
                  );
                },
              );
              setState(() {
                saveChecked(!lock);
              });
            } else if (state is CheckFailure) {
              CustomToast.failure(
                state.message,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              [
                TicketPage(
                  lock: lock,
                ),
                const StockPage(),
                const SummaryPage(),
                const CoursePage(),
                const SizedBox.shrink(),
              ].elementAt(currentIndex),
              const Positioned(
                top: 16,
                right: 16,
                child: CustomIndicator(),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HomeFloating(
          key: keyIntroduction[2],
          lock: lock,
          checkinBloc: checkinBloc,
          checkoutBloc: checkoutBloc,
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              30,
            ),
            topRight: Radius.circular(
              30,
            ),
          ),
          child: BottomAppBar(
            color: CustomColorStyle.white,
            surfaceTintColor: CustomColorStyle.white,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 14,
            child: Row(
              children: [
                CustomBotNav(
                  key: keyIntroduction[0],
                  onTap: () => setState(() {
                    currentIndex = 0;
                  }),
                  current: currentIndex,
                  index: 0,
                  afterIcon: "assets/images/home/ticket_on.svg",
                  beforeIcon: "assets/images/home/ticket_off.svg",
                  title: "Ticket",
                ),
                CustomBotNav(
                  key: keyIntroduction[1],
                  onTap: () => setState(() {
                    currentIndex = 1;
                  }),
                  current: currentIndex,
                  index: 1,
                  afterIcon: "assets/images/home/stock_on.svg",
                  beforeIcon: "assets/images/home/stock_off.svg",
                  title: "Stock",
                ),
                SizedBox(
                  width: 8.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    lock == true ? "Check In" : "Check Out",
                    style: CustomTextStyle.medium(
                      10.sp,
                      color: currentIndex == 4
                          ? CustomColorStyle.orangePrimary
                          : CustomColorStyle.blackPrimary.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                CustomBotNav(
                  key: keyIntroduction[3],
                  onTap: () => setState(() {
                    currentIndex = 2;
                  }),
                  current: currentIndex,
                  index: 2,
                  afterIcon: "assets/images/home/chart_on.svg",
                  beforeIcon: "assets/images/home/chart_off.svg",
                  title: "Summary",
                ),
                CustomBotNav(
                  key: keyIntroduction[4],
                  onTap: () => setState(() {
                    currentIndex = 3;
                  }),
                  current: currentIndex,
                  index: 3,
                  afterIcon: "assets/images/home/course_on.svg",
                  beforeIcon: "assets/images/home/course_off.svg",
                  title: "Course",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
