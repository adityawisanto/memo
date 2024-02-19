import 'package:memo/packages/packages.dart';

class TicketPage extends StatefulWidget {
  static const routeName = "/ticket";

  final bool lock;

  const TicketPage({
    super.key,
    required this.lock,
  });

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final scrollController = ScrollController();
  final ticketBloc = locator<TicketBloc>();
  final pinnedBloc = locator<TicketBloc>();

  final customPreferences = locator<CustomPreferences>();

  final search = TextEditingController();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  String profile = "";
  String username = "";

  List<DataTicket>? listTicket = [];
  List<String> defaultChip = ["Ambang SLA", "OnProgress", "CM", "Impl - New"];
  List<String> selectedChip = [];

  List<String> listAllStatus = ["Pending", "OnProgress"];

  List<String> listAllPrio = ["Low", "Medium", "Critical", "High"];

  List<String> listAllJenis = [
    "Impl - New",
    "Impl - Replacement",
    "CM",
    "PM",
    "SM",
    "Dismantle"
  ];

  List<String> listAllSLA = ["Ambang SLA", "Out SLA"];

  FToast fToast = FToast();

  String params = "status_admin_id:1";

  int total = 0;

  String getFilterCount(String item) {
    if (listAllStatus.contains(item)) {
      String id = "";
      switch (item) {
        case "OnProgress":
          id = "1";
          break;
        case "Pending":
          id = "2";
          break;
        default:
          id = "";
      }
      total = listTicket!.where((e) => e.status.toString() == id).length;
    } else if (listAllPrio.contains(item)) {
      String id = "";
      switch (item) {
        case "Low":
          id = "1";
          break;
        case "Medium":
          id = "2";
          break;
        case "Critical":
          id = "3";
          break;
        case "High":
          id = "4";
          break;
        default:
          id = "0";
      }
      total = listTicket!.where((e) => e.priority.toString() == id).length;
    } else if (listAllJenis.contains(item)) {
      String id = "";
      switch (item) {
        case "Impl - New":
          id = "1";
          break;
        case "Impl - Replacement":
          id = "2";
          break;
        case "CM":
          id = "3";
          break;
        case "PM":
          id = "4";
          break;
        case "SM":
          id = "7";
          break;
        case "Dismantle":
          id = "5";
          break;
        default:
          id = "";
      }
      total = listTicket!.where((e) => e.installType.toString() == id).length;
    } else if (listAllSLA.contains(item)) {
      String id = "";
      switch (item) {
        case "Ambang SLA":
          id = "1";
          break;
        case "Out SLA":
          id = "2";
          break;
        default:
          id = "";
      }
      total = listTicket!.where((e) => e.sla.toString() == id).length;
    } else {
      total = 0;
    }

    return total.toString();
  }

  Future<void> getFilter(String search, String params) async {
    setState(() {
      if (selectedChip.isNotEmpty) {
        scrollController.jumpTo(0.0);
        var isFirstStatus = true;
        var isFirstPrio = true;
        var isFirstJenis = true;
        for (var item in selectedChip) {
          defaultChip.remove(item);
          defaultChip.insert(0, item);

          if (listAllStatus.isNotEmpty ||
              listAllJenis.isNotEmpty ||
              listAllPrio.isNotEmpty) {
            if (listAllStatus.contains(item)) {
              String id = "";
              switch (item) {
                case "OnProgress":
                  id = "1";
                  break;
                case "Pending":
                  id = "2";
                  break;
                default:
                  id = "";
              }
              if (isFirstStatus) {
                params += ",status_ticket_id:$id";
                isFirstStatus = false;
              } else {
                params += "-$id";
              }
            } else {
              params += ",status_ticket_id:1-2";
            }

            if (listAllJenis.contains(item)) {
              String id = "";
              switch (item) {
                case "Impl - New":
                  id = "1";
                  break;
                case "Impl - Replacement":
                  id = "2";
                  break;
                case "CM":
                  id = "3";
                  break;
                case "PM":
                  id = "4";
                  break;
                case "SM":
                  id = "7";
                  break;
                case "Dismantle":
                  id = "5";
                  break;
                default:
                  id = "";
              }
              if (isFirstJenis) {
                params += ",install_type:$id";
                isFirstJenis = false;
              } else {
                params += "-$id";
              }
            }

            if (listAllPrio.contains(item)) {
              String id = "";
              switch (item) {
                case "Low":
                  id = "1";
                  break;
                case "Medium":
                  id = "2";
                  break;
                case "Critical":
                  id = "3";
                  break;
                case "High":
                  id = "4";
                  break;
                default:
                  id = "0";
              }
              if (isFirstPrio) {
                params += ",priority:$id";
                isFirstPrio = false;
              } else {
                params += "-$id";
              }
            }
          } else {
            params += ",status_ticket_id:1-2";
          }

          if (listAllSLA.contains(item)) {
            String id = "";
            switch (item) {
              case "Ambang SLA":
                id = "1";
                break;
              case "Out SLA":
                id = "2";
                break;
              default:
                id = "";
            }
            params += "&out_sla=$id";
          }
        }
      } else {
        defaultChip = ["Ambang SLA", "OnProgress", "CM", "Impl - New"];
        params += ",status_ticket_id:1-2";
      }

      ticketBloc.add(
        TicketGetted(
          type: "ticket",
          params: params,
          search: search,
          startDate: "",
          endDate: "",
          dateField: "",
          page: 1,
          limit: 10,
        ),
      );
    });
  }

  Future<String> getAccount() async {
    final profiles = await customPreferences.getAvatar();
    final results = await customPreferences.getUsername();
    setState(() {
      profile = profiles;
      username = results;
    });
    return username;
  }

  Future<void> onRefresh() async {
    defaultChip = ["Ambang SLA", "OnProgress", "CM", "Impl - New"];
    selectedChip.clear();
    ticketBloc.add(
      const TicketGetted(
        type: "ticket",
        params: "",
        search: "",
        startDate: "",
        endDate: "",
        dateField: "created_at",
        page: 1,
        limit: 10,
      ),
    );
  }

  @override
  void dispose() {
    ticketBloc.close();
    pinnedBloc.close();
    scrollController.dispose();

    search.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAccount();

    getFilter(
      search.text,
      params,
    );

    fToast.init(context);

    ticketBloc.add(
      const TicketGetted(
        type: "ticket",
        params: "",
        search: "",
        startDate: "",
        endDate: "",
        dateField: "created_at",
        page: 1,
        limit: 10,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BlocListener(
            bloc: pinnedBloc,
            listener: (context, state) {
              if (state is TicketLoading) {
                debugPrint("Loading....");
              } else if (state is TicketPostSuccess) {
                fToast.showToast(
                  child: TicketToast(
                    title: state.message,
                  ),
                  gravity: ToastGravity.TOP,
                  toastDuration: const Duration(
                    seconds: 2,
                  ),
                );
                ticketBloc.add(
                  const TicketGetted(
                    type: "ticket",
                    params: "",
                    search: "",
                    startDate: "",
                    endDate: "",
                    dateField: "created_at",
                    page: 1,
                    limit: 10,
                  ),
                );
              } else if (state is TicketFailure) {
                CustomToast.failure(
                  state.message,
                );
              }
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  color: CustomColorStyle.redPrimary,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          profile.isEmpty || profile == ""
                              ? Image.asset(
                                  "assets/images/ticket/avatar.png",
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    profile.toString(),
                                  ),
                                  radius: 14,
                                ),
                          SizedBox(
                            width:
                                profile.isEmpty || profile == "" ? 0.w : 12.w,
                          ),
                          GestureDetector(
                            onTap: () => CustomNavigation.intent(
                              context,
                              ProfilePage.routeName,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Halo, ",
                                    style: CustomTextStyle.regular(
                                      12.sp,
                                      color: CustomColorStyle.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: username,
                                    style: CustomTextStyle.bold(
                                      12.sp,
                                      color: CustomColorStyle.white,
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TicketSearch(
                        key: keyIntroduction[0],
                        search: search,
                        onChanged: (value) => setState(() {
                          getFilter(
                            value,
                            params,
                          );
                        }),
                        onTap: () => setState(() {
                          if (search.text.isNotEmpty) {
                            search.clear();
                            getFilter(
                              search.text,
                              params,
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: BlocBuilder(
                    bloc: ticketBloc,
                    builder: (context, state) {
                      if (state is TicketLoading) {
                        return const TicketShimmer();
                      } else if (state is TicketGetSuccess) {
                        listTicket = state.ticket.data;

                        widget.lock == false
                            ? listTicket!.isNotEmpty
                                ? checkIntroTicket(
                                    keyIntroduction,
                                    context,
                                    customPreferences,
                                  )
                                : null
                            : null;

                        if (selectedChip.isEmpty && listTicket!.isEmpty) {
                          return CustomHandler.empty(
                            type: "ticket",
                          );
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              key: keyIntroduction[1],
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    left: 16,
                                    bottom: 16,
                                  ),
                                  child: InkWell(
                                    onTap: () => showModalBottomSheet(
                                      context: context,
                                      backgroundColor: CustomColorStyle.white,
                                      builder: (BuildContext context) {
                                        return TicketFilter(
                                          selectedChip: selectedChip,
                                          listAllStatus: listAllStatus,
                                          listAllJenis: listAllJenis,
                                          listAllSLA: listAllSLA,
                                          listAllPrio: listAllPrio,
                                          onPressed: () {
                                            getFilter(
                                              search.text,
                                              params,
                                            );
                                            CustomNavigation.back(context);
                                          },
                                        );
                                      },
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      18,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/ticket/filter.svg",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: CustomSize.height(context) / 20,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: defaultChip.length,
                                      itemBuilder: (context, index) {
                                        return TicketFilterItem(
                                          defaultChip: defaultChip,
                                          selectedChip: selectedChip,
                                          index: index,
                                          getFilterCount: getFilterCount,
                                          onSelected: (_) {
                                            setState(() {
                                              if (selectedChip.contains(
                                                defaultChip[index],
                                              )) {
                                                selectedChip.remove(
                                                  defaultChip[index],
                                                );
                                              } else {
                                                selectedChip.add(
                                                  defaultChip[index],
                                                );
                                              }
                                              getFilter(
                                                search.text,
                                                params,
                                              );
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: RefreshIndicator(
                                onRefresh: () => onRefresh(),
                                color: CustomColorStyle.orangePrimary,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: listTicket!.length,
                                  itemBuilder: (context, index) {
                                    return TicketItem(
                                      dataTicket: listTicket![index],
                                      pinnedBloc: pinnedBloc,
                                    );
                                  },
                                ),
                              ),
                            ),
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
                ),
              ],
            ),
          ),
          widget.lock == true
              ? Container(
                  width: CustomSize.width(context),
                  height: CustomSize.height(context),
                  color: CustomColorStyle.blackPrimary.withOpacity(
                    0.6,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
