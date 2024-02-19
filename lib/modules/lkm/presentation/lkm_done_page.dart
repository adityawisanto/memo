import 'package:intl/intl.dart';
import 'package:memo/packages/packages.dart';

class LkmDonePage extends StatefulWidget {
  static const routeName = "/lkm_done";

  final LkmArgument lkmArgument;

  const LkmDonePage({
    super.key,
    required this.lkmArgument,
  });

  @override
  State<LkmDonePage> createState() => _LkmDonePageState();
}

class _LkmDonePageState extends State<LkmDonePage> {
  final customPreferences = locator<CustomPreferences>();

  final auditBloc = locator<AuditBloc>();
  final warehouseBloc = locator<WarehouseBloc>();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  bool check = true;
  bool activity = false;
  bool information = false;

  final scrollController = ScrollController();

  Map<String, String> selectPurchase = {};
  Map<String, String> selectBrizzi = {};
  Map<String, String> selectQris = {};
  Map<String, String> selectActivity = {};
  Map<String, String> selectNote = {};

  Map<String, String> selectEdc = {};

  List<TextEditingController> edcController = [];
  List<TextEditingController> warehouseController = [];

  bool edcChanged = false;

  WarehouseSn? snEdcP1;
  WarehouseSn? snEdcP2;

  String? edcType;

  String? installType;

  final sn = TextEditingController();

  final clockOpen = TextEditingController();
  final clockClose = TextEditingController();
  final address = TextEditingController();
  final description = TextEditingController();

  MasterDropdownLkmMerchant? merchantType;

  bool? bca = false;
  bool? bni = false;
  bool? cimb = false;
  bool? mandiri = false;
  bool? ocbc = false;

  List<String> anotherEdc = [];

  bool isSwitchEdcChanged = false;
  bool isEdcChanged = false;
  bool isEdcType = false;
  bool isReadOnlySn = false;

  String? hint;

  Future<void> logic() async {
    setState(() {
      clockOpen.text = widget.lkmArgument.dataTicket!.openHours.toString();
      clockClose.text = widget.lkmArgument.dataTicket!.closeHours.toString();
      address.text = widget.lkmArgument.dataTicket!.address.toString();

      installType = widget.lkmArgument.dataTicket!.installType.toString();
      final snOld = widget.lkmArgument.dataTicket!.sn.toString();
      edcType = snOld.contains("PE") ? "P1-4G" : "P2";

      if (installType == MasterJsonTicket.ttImpln) {
        sn.clear();
        isReadOnlySn = false;
      } else {
        sn.text = snOld.toString();
        isReadOnlySn = true;
      }

      //Preventive
      if (installType == MasterJsonTicket.ttPm) {
        isEdcType = true;
      }

      //Corrective
      if (installType == MasterJsonTicket.ttCm) {
        isSwitchEdcChanged = true;
        isEdcType = true;
      }

      //Replacement
      if (installType == MasterJsonTicket.ttImplr) {
        sn.clear();
        hint = snOld;
        isReadOnlySn = false;
        isEdcChanged = true;
        isEdcType = true;
      }
    });
  }

  Future<void> back() async {
    if (check == true) {
      CustomDialog().information(
        "Perhatian",
        "Batalkan isi LKM ?",
        no: "Tidak",
        negative: () => CustomNavigation.back(context),
        yes: "Ya",
        positive: () async => await customPreferences.clearImage().then(
              (value) => CustomNavigation.intentWithClearAllRoutes(
                context,
                MerchantPage.routeName,
                arguments: MerchantArgument(
                  dataTicket: widget.lkmArgument.dataTicket,
                ),
              ),
            ),
        backgroundPositive: CustomColorStyle.white,
        colorTextPositive: CustomColorStyle.orangePrimary,
        reverse: true,
      );
    } else if (activity == true) {
      setState(() {
        check = true;
        activity = false;
        information = false;
      });
    } else if (information == true) {
      setState(() {
        check = false;
        activity = true;
        information = false;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    auditBloc.close();
    warehouseBloc.close();
    sn.dispose();
    clockOpen.dispose();
    clockClose.dispose();
    address.dispose();
    description.dispose();

    for (var controller in edcController) {
      controller.dispose();
    }
    for (var controller in warehouseController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    logic();

    auditBloc.add(
      AuditGetted(),
    );
    warehouseBloc.add(
      WarehouseGetted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withPopScope(
        "Isi LKM",
        onTap: () => back(),
      ),
      body: BlocBuilder(
        bloc: auditBloc,
        builder: (context, audit) {
          if (audit is AuditLoading) {
            debugPrint("Loading");
          } else if (audit is AuditGetSuccess) {
            final listPurchase = audit.audit.data!
                .where(
                  (item) => item.category == "purchase",
                )
                .toList();
            final listBrizzi = audit.audit.data!
                .where(
                  (item) => item.category == "brizzi",
                )
                .toList();
            final listQris = audit.audit.data!
                .where(
                  (item) => item.category == "qris",
                )
                .toList();
            final listHelp = audit.audit.data!
                .where(
                  (item) => item.category == "help",
                )
                .toList();

            final listActivity = audit.audit.data!
                .where(
                  (item) => item.category == "aktivitas",
                )
                .toList();

            final listNote = audit.audit.data!
                .where(
                  (item) => item.category == "note",
                )
                .toList();
            checkIntroLkmDone(
              keyIntroduction,
              context,
              customPreferences,
            );
            return BlocBuilder(
              bloc: warehouseBloc,
              builder: (context, warehouse) {
                if (warehouse is WarehouseLoading) {
                  debugPrint("Loading");
                } else if (warehouse is WarehouseGetSuccess) {
                  final listWarehouse = warehouse.warehouse.data!
                      .where(
                        (e) => e.category == "Item",
                      )
                      .toList();
                  return installType == MasterJsonTicket.ttDist
                      ? dismantle(
                          listHelp,
                          listWarehouse,
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  key: keyIntroduction[0],
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1.5,
                                          color: CustomColorStyle.orangePrimary,
                                        ),
                                      ),
                                      color: check == true
                                          ? CustomColorStyle.white
                                          : CustomColorStyle.orangePrimary,
                                    ),
                                    child: Text(
                                      "PENGECHECKAN",
                                      style: CustomTextStyle.bold(
                                        10.sp,
                                        color: check == true
                                            ? CustomColorStyle.orangePrimary
                                            : CustomColorStyle.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  key: keyIntroduction[1],
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1.5,
                                          color: check == true
                                              ? CustomColorStyle.white
                                              : activity == true
                                                  ? CustomColorStyle
                                                      .orangePrimary
                                                  : information == true
                                                      ? CustomColorStyle
                                                          .orangePrimary
                                                      : CustomColorStyle.white,
                                        ),
                                      ),
                                      color: check == true
                                          ? CustomColorStyle.white
                                          : information == true
                                              ? CustomColorStyle.orangePrimary
                                              : CustomColorStyle.white,
                                    ),
                                    child: Text(
                                      "AKTIVITAS",
                                      style: CustomTextStyle.bold(
                                        10.sp,
                                        color: check == true
                                            ? CustomColorStyle.orangePrimary
                                            : information == true
                                                ? CustomColorStyle.white
                                                : CustomColorStyle
                                                    .orangePrimary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  key: keyIntroduction[2],
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1.5,
                                          color: information == true
                                              ? CustomColorStyle.orangePrimary
                                              : CustomColorStyle.white,
                                        ),
                                      ),
                                      color: CustomColorStyle.white,
                                    ),
                                    child: Text(
                                      "INFORMASI",
                                      style: CustomTextStyle.bold(
                                        10.sp,
                                        color: CustomColorStyle.orangePrimary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.only(
                                  bottom: 50,
                                ),
                                child: Column(
                                  children: [
                                    checkedTab(
                                      listPurchase,
                                      listBrizzi,
                                      listQris,
                                      listHelp,
                                      listActivity,
                                    ),
                                    activityTab(
                                      listActivity,
                                      listNote,
                                    ),
                                    informationTab(
                                      listHelp,
                                      listWarehouse,
                                      warehouse.warehouse,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                } else if (warehouse is WarehouseFailure) {
                  CustomToast.failure(
                    warehouse.message,
                  );
                }
                return const SizedBox.shrink();
              },
            );
          } else if (audit is AuditFailure) {
            CustomToast.failure(
              audit.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget checkedTab(
    List<DataAudit> listPurchase,
    List<DataAudit> listBrizzi,
    List<DataAudit> listQris,
    List<DataAudit> listHelp,
    List<DataAudit> listActivity,
  ) {
    return Visibility(
      visible: check,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PURCHASE",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                        Text(
                          "Status",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    listPurchase.isEmpty
                        ? CustomHandler.empty()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPurchase.length,
                            itemBuilder: (context, index) {
                              return LkmRadioItem(
                                dataAudit: listPurchase[index],
                                selectValue: selectPurchase[
                                        listPurchase[index].name.toString()] ??
                                    '',
                                onChangedOk: (value) => setState(() {
                                  selectPurchase[listPurchase[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                                onChangedNotOk: (value) => setState(() {
                                  selectPurchase[listPurchase[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BRIZZI",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                        Text(
                          "Status",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    listBrizzi.isEmpty
                        ? CustomHandler.empty()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listBrizzi.length,
                            itemBuilder: (context, index) {
                              return LkmRadioItem(
                                dataAudit: listBrizzi[index],
                                selectValue: selectBrizzi[
                                        listBrizzi[index].name.toString()] ??
                                    '',
                                onChangedOk: (value) => setState(() {
                                  selectBrizzi[listBrizzi[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                                onChangedNotOk: (value) => setState(() {
                                  selectBrizzi[listBrizzi[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "QRIS",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                        Text(
                          "Status",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    listQris.isEmpty
                        ? CustomHandler.empty()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listQris.length,
                            itemBuilder: (context, index) {
                              return LkmRadioItem(
                                dataAudit: listQris[index],
                                selectValue: selectQris[
                                        listQris[index].name.toString()] ??
                                    '',
                                onChangedOk: (value) => setState(() {
                                  selectQris[listQris[index].name.toString()] =
                                      value.toString();
                                }),
                                onChangedNotOk: (value) => setState(() {
                                  selectQris[listQris[index].name.toString()] =
                                      value.toString();
                                }),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            edcCompletes(
              listHelp,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              onPressed: () {
                if (listPurchase.length != selectPurchase.length) {
                  CustomDialog().information(
                    "Purchase masih kosong",
                    "Silahkan diisi secara lengkap",
                    negative: () => CustomNavigation.back(context),
                    withNetral: true,
                    no: "Baik",
                  );
                } else if (listBrizzi.length != selectBrizzi.length) {
                  CustomDialog().information(
                    "Brizzi masih kosong",
                    "Silahkan diisi secara lengkap",
                    negative: () => CustomNavigation.back(context),
                    withNetral: true,
                    no: "Baik",
                  );
                } else if (listQris.length != selectQris.length) {
                  CustomDialog().information(
                    "Qris masih kosong",
                    "Silahkan diisi secara lengkap",
                    negative: () => CustomNavigation.back(context),
                    withNetral: true,
                    no: "Baik",
                  );
                } else {
                  selectEdc.clear();
                  for (int i = 0; i < edcController.length; i++) {
                    if (edcController[i].text != "") {
                      selectEdc[listHelp[i].name.toString()] =
                          edcController[i].text;
                    }
                  }
                  if (selectEdc.length != edcController.length) {
                    CustomDialog().information(
                      "Kelengkapan EDC masih kosong",
                      "Silahkan diisi secara lengkap",
                      negative: () => CustomNavigation.back(context),
                      withNetral: true,
                      no: "Baik",
                    );
                  } else {
                    debugPrint("purchase : ${json.encode(selectPurchase)}");
                    debugPrint("brizzi : ${json.encode(selectBrizzi)}");
                    debugPrint("qris : ${json.encode(selectQris)}");
                    debugPrint("kelengkapan edc : ${json.encode(selectEdc)}");
                    setState(() {
                      check = false;
                      activity = true;
                      information = false;
                      scrollController.jumpTo(0.0);
                    });
                  }
                }
              },
              label: "Selanjutnya",
            ),
          ],
        ),
      ),
    );
  }

  Widget activityTab(
    List<DataAudit> listActivity,
    List<DataAudit> listNote,
  ) {
    return Visibility(
      visible: activity,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "AKTIVITAS",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                        Text(
                          "Status",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    listActivity.isEmpty
                        ? CustomHandler.empty()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listActivity.length,
                            itemBuilder: (context, index) {
                              return LkmRadioItem(
                                dataAudit: listActivity[index],
                                selectValue: selectActivity[
                                        listActivity[index].name.toString()] ??
                                    '',
                                onChangedOk: (value) => setState(() {
                                  selectActivity[listActivity[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                                onChangedNotOk: (value) => setState(() {
                                  selectActivity[listActivity[index]
                                      .name
                                      .toString()] = value.toString();
                                }),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NOTE",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                        Text(
                          "Status",
                          style: CustomTextStyle.bold(
                            12.sp,
                            color: CustomColorStyle.orangePrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    listNote.isEmpty
                        ? CustomHandler.empty()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listNote.length,
                            itemBuilder: (context, index) {
                              return LkmRadioItem(
                                dataAudit: listNote[index],
                                selectValue: selectNote[
                                        listNote[index].name.toString()] ??
                                    '',
                                onChangedOk: (value) => setState(() {
                                  selectNote[listNote[index].name.toString()] =
                                      value.toString();
                                }),
                                onChangedNotOk: (value) => setState(() {
                                  selectNote[listNote[index].name.toString()] =
                                      value.toString();
                                }),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              onPressed: () {
                if (listActivity.length != selectActivity.length) {
                  CustomDialog().information(
                    "Aktivitas masih kosong",
                    "Silahkan diisi secara lengkap",
                    negative: () => CustomNavigation.back(context),
                    withNetral: true,
                    no: "Baik",
                  );
                } else if (listNote.length != selectNote.length) {
                  CustomDialog().information(
                    "Note masih kosong",
                    "Silahkan diisi secara lengkap",
                    negative: () => CustomNavigation.back(context),
                    withNetral: true,
                    no: "Baik",
                  );
                } else {
                  debugPrint("aktivitas : ${json.encode(selectActivity)}");
                  debugPrint("note : ${json.encode(selectNote)}");
                  setState(() {
                    check = false;
                    activity = false;
                    information = true;

                    scrollController.jumpTo(0.0);
                  });
                }
              },
              label: "Selanjutnya",
            ),
          ],
        ),
      ),
    );
  }

  Widget informationTab(
    List<DataAudit> listHelp,
    List<DataWarehouse> listWarehouse,
    Warehouse warehouse,
  ) {
    return Visibility(
      visible: information,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isSwitchEdcChanged,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terdapat Penggantian EDC",
                        style: CustomTextStyle.bold(
                          10.sp,
                          color: CustomColorStyle.orangePrimary,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          useMaterial3: false,
                        ),
                        child: Switch(
                          value: edcChanged,
                          onChanged: (value) {
                            setState(() {
                              edcChanged = value;
                            });
                          },
                          activeColor: CustomColorStyle.orangePrimary,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: edcChanged,
                    child: edcInstallation(
                      warehouse,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isEdcChanged,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: edcInstallation(
                  warehouse,
                ),
              ),
            ),
            Visibility(
              visible: isEdcType,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "EDC${edcChanged == true ? " yang ditarik" : ""}",
                    style: CustomTextStyle.bold(
                      10.sp,
                      color: CustomColorStyle.orangePrimary,
                    ),
                  ),
                  LkmEdcRectracted(
                    edcType: edcType,
                    onChanged: (value) {
                      setState(() {
                        edcType = value;
                      });
                    },
                  ),
                  LkmSn(
                    sn: sn,
                    readOnly: isReadOnlySn,
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: listWarehouse.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 12,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                TextEditingController controller = TextEditingController(
                  text: listWarehouse[index].def.toString(),
                );
                warehouseController.add(controller);
                return LkmWarehouseItem(
                  dataWarehouse: listWarehouse[index],
                  lkmArgument: widget.lkmArgument,
                  controller: controller,
                  onTapRemove: () => setState(() {
                    int currentValue = int.parse(
                      warehouseController[index].text,
                    );

                    if (currentValue > 0) {
                      warehouseController[index].text =
                          (currentValue - 1).toString();

                      listWarehouse[index].def = currentValue - 1;
                    }
                  }),
                  onChanged: (value) => setState(() {
                    listWarehouse[index].def = int.tryParse(value) ?? 0;
                    warehouseController[index].text = value.toString();
                  }),
                  onTapAdd: () => setState(() {
                    int currentValue = int.parse(
                      warehouseController[index].text,
                    );

                    if (currentValue + 1 <= listWarehouse[index].total!) {
                      warehouseController[index].text =
                          (currentValue + 1).toString();

                      listWarehouse[index].def = currentValue + 1;
                    }
                  }),
                );
              },
            ),
            formAboutMerchant(
              listHelp,
              listWarehouse,
            ),
          ],
        ),
      ),
    );
  }

  Widget dismantle(
    List<DataAudit> listHelp,
    List<DataWarehouse> listWarehouse,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EDC",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          LkmEdcRectracted(
            edcType: edcType,
            onChanged: (value) {
              setState(() {
                edcType = value;
              });
            },
          ),
          LkmSn(
            sn: sn,
            readOnly: isReadOnlySn,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Inventory yang ditarik",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          edcCompletes(
            listHelp,
          ),
          SizedBox(
            height: 8.h,
          ),
          formAboutMerchant(
            listHelp,
            listWarehouse,
          ),
        ],
      ),
    );
  }

  Widget formAboutMerchant(
    List<DataAudit> listHelp,
    List<DataWarehouse> listWarehouse,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Info Tambahan",
          style: CustomTextStyle.bold(
            10.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            clockField(
              "Jam Buka",
              clockOpen,
            ),
            SizedBox(
              width: 12.w,
            ),
            clockField(
              "Jam Tutup",
              clockClose,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        LkmTextInput(
          controller: address,
          title: "Alamat Merchant",
        ),
        SizedBox(
          height: 16.h,
        ),
        LkmTypeMerchant(
          merchantType: merchantType,
          onChanged: (value) {
            setState(() {
              merchantType = value;
            });
          },
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "EDC Lain",
          style: CustomTextStyle.bold(
            10.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        Row(
          children: [
            LkmCheckBoxItem(
              title: "BCA",
              value: bca!,
              onChanged: (value) {
                setState(() {
                  bca = value!;
                  if (bca!) {
                    anotherEdc.add("BCA");
                  } else {
                    anotherEdc.remove("BCA");
                  }
                });
              },
            ),
            LkmCheckBoxItem(
              title: "BNI",
              value: bni!,
              onChanged: (value) {
                setState(() {
                  bni = value!;
                  if (bni!) {
                    anotherEdc.add("BNI");
                  } else {
                    anotherEdc.remove("BNI");
                  }
                });
              },
            ),
            LkmCheckBoxItem(
              title: "CIMB",
              value: cimb!,
              onChanged: (value) {
                setState(() {
                  cimb = value!;
                  if (cimb!) {
                    anotherEdc.add("CIMB");
                  } else {
                    anotherEdc.remove("CIMB");
                  }
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            LkmCheckBoxItem(
              title: "Mandiri",
              value: mandiri!,
              onChanged: (value) {
                setState(() {
                  mandiri = value!;
                  if (mandiri!) {
                    anotherEdc.add("Mandiri");
                  } else {
                    anotherEdc.remove("Mandiri");
                  }
                });
              },
            ),
            LkmCheckBoxItem(
              title: "OCBC NISP",
              value: ocbc!,
              onChanged: (value) {
                setState(() {
                  ocbc = value!;
                  if (ocbc!) {
                    anotherEdc.add("OCBC NISP");
                  } else {
                    anotherEdc.remove("OCBC NISP");
                  }
                });
              },
            ),
            const Spacer(),
          ],
        ),
        LkmTextInput(
          controller: description,
          title: "Keterangan Kunjungan",
          withMultiline: true,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomButton(
          onPressed: () {
            debugPrint("sn edc p1 : $snEdcP1");
            debugPrint("sn edc p2 : $snEdcP2");
            debugPrint("edc type : $edcType");
            debugPrint("sn : ${sn.text}");
            debugPrint("warehouse : ${listWarehouse.map((e) => e.def)}");
            debugPrint("clock open : ${clockOpen.text}");
            debugPrint("clock close : ${clockClose.text}");
            debugPrint("address : ${address.text}");
            debugPrint("merchant type : $merchantType");
            debugPrint("another edc : $anotherEdc");
            debugPrint("visit : ${description.text}");

            for (int i = 0; i < edcController.length; i++) {
              selectEdc[listHelp[i].name.toString()] = edcController[i].text;
            }

            CustomNavigation.intentWithData(
              context,
              EvidencePage.routeName,
              EvidenceArgument(
                lkmArgument: widget.lkmArgument,
                purchase: selectPurchase,
                brizzi: selectBrizzi,
                qris: selectQris,
                edcComplete: selectEdc,
                activity: selectActivity,
                note: selectNote,
                snEdcP1: snEdcP1,
                snEdcP2: snEdcP2,
                edcType: edcType,
                sn: sn.text,
                listItem: listWarehouse,
                clockOpen: clockOpen.text,
                clockClose: clockClose.text,
                address: address.text,
                merchantType: merchantType,
                anotherEdc: anotherEdc,
                visit: description.text,
              ),
            );
          },
          label: "Selanjutnya",
        ),
      ],
    );
  }

  Widget edcInstallation(
    Warehouse warehouse,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pilih EDC Pemasangan",
          style: CustomTextStyle.bold(
            10.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Row(
          children: [
            Expanded(
              child: LkmEdcInstallation(
                title: "EDC P1",
                warehouse: warehouse,
                hint: hint,
                index: 0,
                warehouseSn: snEdcP1,
                onChanged: (value) => setState(() {
                  snEdcP1 = value;
                  snEdcP2 = null;
                }),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: LkmEdcInstallation(
                title: "EDC P2",
                warehouse: warehouse,
                index: 1,
                warehouseSn: snEdcP2,
                onChanged: (value) => setState(() {
                  snEdcP2 = value;
                  snEdcP1 = null;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget clockField(
    String title,
    TextEditingController textController,
  ) {
    return LkmClockItem(
      clock: textController,
      title: title,
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          initialEntryMode: TimePickerEntryMode.dial,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: CustomColorStyle.orangePrimary,
                ),
              ),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: true,
                ),
                child: child!,
              ),
            );
          },
        );

        if (pickedTime != null) {
          setState(
            () {
              textController.text = DateFormat('HH:mm').format(
                DateFormat(
                        "HH:mm${Platform.isIOS ? " a" : Platform.isAndroid ? "" : ""}")
                    .parse(
                  pickedTime.format(context),
                ),
              );
            },
          );
        } else {
          textController.text = DateFormat('HH:mm').format(
            DateTime.now(),
          );
        }
      },
    );
  }

  Widget edcCompletes(
    List<DataAudit> listHelp,
  ) {
    edcController = List.generate(
      listHelp.length,
      (index) => TextEditingController(
        text: listHelp[index].def,
      ),
    );
    return CustomCard(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kelengkapan EDC",
                  style: CustomTextStyle.bold(
                    12.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
                Text(
                  "Jumlah",
                  style: CustomTextStyle.bold(
                    12.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            listHelp.isEmpty
                ? CustomHandler.empty()
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listHelp.length,
                    itemBuilder: (context, index) {
                      return LkmEdcComplete(
                        dataAudit: listHelp[index],
                        index: index,
                        onChanged: (value) => setState(() {
                          listHelp[index].def = value;
                          edcController[index].text = value.toString();
                        }),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
