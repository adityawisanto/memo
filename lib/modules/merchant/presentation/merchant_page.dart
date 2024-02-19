import 'package:memo/packages/packages.dart';

class MerchantPage extends StatefulWidget {
  static const routeName = "/merchant";

  final MerchantArgument merchantArgument;

  const MerchantPage({
    super.key,
    required this.merchantArgument,
  });

  @override
  State<MerchantPage> createState() => _MerchantPageState();
}

class _MerchantPageState extends State<MerchantPage> {
  final statusBloc = locator<StatusBloc>();
  final updateBloc = locator<StatusBloc>();
  final customPreferences = locator<CustomPreferences>();

  final scrollController = ScrollController();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  MasterDropdownTicketStatus? status;
  DataStatus? dataStatus;
  MasterDropdownEdc? edcPrimary;
  MasterDropdownReason? reasonA;
  MasterDropdownReason? reasonB;

  @override
  void dispose() {
    updateBloc.close();
    statusBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    checkIntroMerchant(
      keyIntroduction,
      context,
      customPreferences,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withPopScope(
        "Detail Ticket",
        onTap: () => CustomNavigation.intentWithClearAllRoutes(
          context,
          HomePage.routeName,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 50,
        ),
        child: SafeArea(
          child: Column(
            children: [
              MerchantTicket(
                key: keyIntroduction[0],
                merchantArgument: widget.merchantArgument,
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: CustomSize.width(context),
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      children: [
                        MerchantAbout(
                          key: keyIntroduction[1],
                          merchantArgument: widget.merchantArgument,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        MerchantTerminal(
                          key: keyIntroduction[2],
                          merchantArgument: widget.merchantArgument,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomCard(
                key: keyIntroduction[3],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomDropdown(
                    hint: "Status Pengerjaan",
                    value: status,
                    items: dataMasterDropdownTicketStatus.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Center(
                          child: Text(
                            value.title.toString(),
                            style: CustomTextStyle.medium(
                              10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        edcPrimary = null;
                        dataStatus = null;
                        reasonA = null;
                        reasonB = null;
                        status = newValue;
                        statusBloc.add(
                          StatusGetted(
                            type: MasterJsonTicket().installationType(
                              widget.merchantArgument.dataTicket!.installType
                                  .toString(),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              BlocBuilder(
                bloc: statusBloc,
                builder: (context, state) {
                  if (state is StatusLoading) {
                  } else if (state is StatusGetSuccess) {
                    return status != null
                        ? CustomCard(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CustomDropdown(
                                hint: "Pilih",
                                value: dataStatus,
                                items: state.status.data!
                                    .where(
                                  (it) =>
                                      it.titleStatus ==
                                      status?.title.toString(),
                                )
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Wrap(
                                      children: [
                                        Center(
                                          child: Text(
                                            value.detailStatus.toString(),
                                            style: CustomTextStyle.medium(
                                              10.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (DataStatus? newValue) {
                                  setState(() {
                                    if (status!.title.toString() ==
                                        "OnProgress") {
                                      updateBloc.add(
                                        StatusSubmitted(
                                          idTicket: widget
                                              .merchantArgument.dataTicket!.id,
                                          idStatus: newValue!.idStatus,
                                          idStatusDetail:
                                              newValue.idDetailStatus,
                                          statusTicket: newValue.detailStatus,
                                          notes: "",
                                        ),
                                      );
                                    } else {
                                      dataStatus = newValue;
                                      edcPrimary = null;
                                    }
                                    scrollController.jumpTo(scrollController
                                        .position.maxScrollExtent);
                                  });
                                },
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  } else if (state is StatusFailure) {
                    CustomToast.failure(
                      state.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              status != null &&
                      status!.title.toString() != "OnProgress" &&
                      status!.title.toString() != "Pending" &&
                      dataStatus != null
                  ? CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: CustomDropdown(
                          hint: "Status EDC",
                          value: edcPrimary,
                          items: dataMasterDropdownEdc.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Center(
                                child: Text(
                                  value.title.toString(),
                                  style: CustomTextStyle.medium(
                                    10.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              edcPrimary = newValue;
                              reasonA = null;
                              reasonB = null;
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            });
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: 8.h,
              ),
              status != null &&
                      status!.title.toString() != "OnProgress" &&
                      status!.title.toString() != "Pending" &&
                      dataStatus != null &&
                      edcPrimary != null
                  ? CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: CustomDropdown(
                          hint: "Alasan Pengguna",
                          value: edcPrimary!.id == 1 ? reasonA : reasonB,
                          items: (edcPrimary!.id == 1
                                  ? dataMasterDropdownReasonA
                                  : dataMasterDropdownReasonB)
                              .map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Center(
                                child: Text(
                                  value.title.toString(),
                                  style: CustomTextStyle.medium(
                                    10.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              if (edcPrimary!.id == 1) {
                                reasonA = newValue;
                              } else {
                                reasonB = newValue;
                              }
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            });
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: reasonA != null || reasonB != null ? 8.h : 0.h,
              ),
              status != null &&
                      status!.title.toString() == "Pending" &&
                      dataStatus != null
                  ? MerchantLkm(
                      merchantArgument: widget.merchantArgument,
                      status: status,
                      dataStatus: dataStatus,
                      edcPrimary: edcPrimary,
                      reasonA: reasonA,
                      reasonB: reasonB,
                    )
                  : reasonA != null || reasonB != null
                      ? MerchantLkm(
                          merchantArgument: widget.merchantArgument,
                          status: status,
                          dataStatus: dataStatus,
                          edcPrimary: edcPrimary,
                          reasonA: reasonA,
                          reasonB: reasonB,
                        )
                      : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
