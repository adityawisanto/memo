import 'package:geolocator/geolocator.dart';
import 'package:memo/packages/packages.dart';

class BundlePage extends StatefulWidget {
  static const routeName = "/bundle";

  final BundleArgument bundleArgument;

  const BundlePage({
    super.key,
    required this.bundleArgument,
  });

  @override
  State<BundlePage> createState() => _BundlePageState();
}

class _BundlePageState extends State<BundlePage> {
  final bundleBloc = locator<BundleBloc>();
  final customPreferences = locator<CustomPreferences>();

  @override
  void dispose() {
    bundleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "Preview & Konfirmasi LKM",
        onTap: () => CustomNavigation.back(context),
      ),
      body: BlocListener(
        bloc: bundleBloc,
        listener: (context, state) {
          if (state is BundleLoading) {
            CustomNavigation.back(context);
            CustomDialog().loading(
              "Mohon tunggu sebentar....",
            );
          } else if (state is BundlePostSuccess) {
            customPreferences.clearImage();
            CustomNavigation.back(context);
            CustomDialog().success(
              "Sukses !",
              "LKM Telah Disimpan",
            );
            Future.delayed(
              const Duration(
                seconds: 2,
              ),
              () => CustomNavigation.intentWithClearAllRoutes(
                context,
                HomePage.routeName,
              ),
            );
          } else if (state is BundleFailure) {
            customPreferences.clearImage();
            CustomNavigation.back(context);
            CustomDialog().success(
              "Sukses !",
              "LKM Telah Disimpan",
            );
            Future.delayed(
              const Duration(
                seconds: 2,
              ),
              () => CustomNavigation.intentWithClearAllRoutes(
                context,
                HomePage.routeName,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 50,
          ),
          child: Column(
            children: [
              CustomCard(
                child: Column(
                  children: [
                    widget.bundleArgument.signatureArgument!.evidenceArgument!
                                .lkmArgument!.status!.title ==
                            "Done"
                        ? BundleTextDone(
                            bundleArgument: widget.bundleArgument,
                          )
                        : const SizedBox.shrink(),
                    BundleTextPending(
                      bundleArgument: widget.bundleArgument,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BundleEvidence(
                bundleArgument: widget.bundleArgument,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      backgroundColor: CustomColorStyle.white,
                      fontColor: CustomColorStyle.orangePrimary,
                      onPressed: () => CustomDialog().information(
                        "Perhatian",
                        "Batalkan isi LKM ?",
                        no: "Tidak",
                        negative: () => CustomNavigation.back(context),
                        yes: "Ya",
                        positive: () =>
                            CustomNavigation.intentWithClearAllRoutes(
                          context,
                          MerchantPage.routeName,
                          arguments: MerchantArgument(
                            dataTicket: widget.bundleArgument.signatureArgument!
                                .evidenceArgument!.lkmArgument!.dataTicket,
                          ),
                        ),
                        backgroundPositive: CustomColorStyle.white,
                        colorTextPositive: CustomColorStyle.orangePrimary,
                        reverse: true,
                      ),
                      label: "Batal",
                    ),
                  ),
                  SizedBox(
                    width: 16.h,
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () => CustomDialog().information(
                        "Perhatian",
                        "Apakah data sudah benar?",
                        no: "Tidak",
                        negative: () => CustomNavigation.back(context),
                        yes: "Ya",
                        positive: () async {
                          if (await Geolocator.isLocationServiceEnabled()) {
                            LocationPermission permission =
                                await Geolocator.checkPermission();

                            if (permission == LocationPermission.denied) {
                              permission = await Geolocator.requestPermission();
                              if (permission == LocationPermission.denied) {
                                CustomToast.regular(
                                    "Location Permissions Are Denied");
                                openAppSettings();
                              } else if (permission ==
                                  LocationPermission.deniedForever) {
                                CustomToast.regular(
                                    "Location Permissions Are Permanently Denied");
                                openAppSettings();
                              }
                            } else {
                              sendLkm();
                            }
                          } else {
                            CustomToast.regular(
                              "GPS Service is not enabled, turn on GPS location",
                            );
                          }
                        },
                        backgroundNegative: CustomColorStyle.white,
                        colorTextNegative: CustomColorStyle.orangePrimary,
                      ),
                      label: "Simpan",
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

  Future<void> sendLkm() async {
    String idTicket = widget.bundleArgument.signatureArgument!.evidenceArgument!
        .lkmArgument!.dataTicket!.id
        .toString();

    String noTicket = widget.bundleArgument.signatureArgument!.evidenceArgument!
        .lkmArgument!.dataTicket!.idSubTicket
        .toString();

    String installType = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.dataTicket!.installType
        .toString();

    String sn = widget.bundleArgument.signatureArgument!.evidenceArgument!
        .lkmArgument!.dataTicket!.sn
        .toString();

    String noLkm =
        "$idTicket-${MasterJsonTicket().generateNoLkm(installType)}-${CustomDate.formatDate(DateTime.now().toString(), format: "yyyyMMdd")}";

    Map<String, String>? purchase =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.purchase;

    Map<String, String>? brizzi =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.brizzi;

    Map<String, String>? qris =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.qris;

    Map<String, String>? help =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.edcComplete;

    Map<String, String>? activity =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.activity;

    Map<String, String>? note =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.note;

    List<String>? listEdcLain =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.anotherEdc;

    MasterDropdownLkmMerchant? typeMerchant =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.merchantType;

    MasterDropdownEdc? edcStatus = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.edcPrimary;

    MasterDropdownReason? reasonA = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.reasonA;
    MasterDropdownReason? reasonB = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.reasonB;
    String edcPrimary = reasonA != null
        ? "${edcStatus!.title.toString()} - ${reasonA.title.toString()}"
        : reasonB != null
            ? "${edcStatus!.title.toString()} - ${reasonB.title.toString()}"
            : "";

    String? visit =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.visit;

    List<DataWarehouse>? listItem =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.listItem;

    String? merchantImg =
        widget.bundleArgument.signatureArgument!.signBase64.toString();
    String? cashierImg =
        widget.bundleArgument.signatureArgument!.cashierBase64.toString();
    String? edcImg =
        widget.bundleArgument.signatureArgument!.edcBase64.toString();
    String? purchaseImg =
        widget.bundleArgument.signatureArgument!.strukBase64.toString();
    String? brizziImg =
        widget.bundleArgument.signatureArgument!.brizziBase64.toString();
    String? qrisImg =
        widget.bundleArgument.signatureArgument!.qrisBase64.toString();
    String? optionalImg =
        widget.bundleArgument.signatureArgument!.optionalBase64.toString();
    String? optional2Img =
        widget.bundleArgument.signatureArgument!.optional2Base64.toString();

    String? merchantName = widget.bundleArgument.merchantName ?? "";
    String? merchantNumber = widget.bundleArgument.merchantPhone ?? "";
    String? merchantSign = widget.bundleArgument.merchantTtd == null
        ? ""
        : base64Encode(
            widget.bundleArgument.merchantTtd!,
          );

    String? officerName = widget.bundleArgument.meriName ?? "";
    String? officerNumber = widget.bundleArgument.meriPhone ?? "";
    String? officerSign = widget.bundleArgument.meriTtd == null
        ? ""
        : base64Encode(
            widget.bundleArgument.meriTtd!,
          );

    int? idStatus = widget.bundleArgument.signatureArgument!.evidenceArgument!
        .lkmArgument!.dataStatus!.idStatus;
    int? idStatusDetail = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.dataStatus!.idDetailStatus;
    String? statusTicket = widget.bundleArgument.signatureArgument!
        .evidenceArgument!.lkmArgument!.dataStatus!.detailStatus;

    String? merchantOpenTime =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.clockOpen ??
            "";

    String? merchantCloseTime =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.clockClose ??
            "";

    String? merchantAddress =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.address ??
            "";

    WarehouseSn? snEdcP1 =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.snEdcP1;

    WarehouseSn? snEdcP2 =
        widget.bundleArgument.signatureArgument!.evidenceArgument!.snEdcP2;

    String? edcGetted;
    String? edcPenarikan;

    if (snEdcP1 != null) {
      edcGetted = "${snEdcP1.idSn},${snEdcP1.sn.toString()}";
    } else if (snEdcP2 != null) {
      edcGetted = "${snEdcP2.idSn},${snEdcP2.sn.toString()}";
    } else if ((installType == MasterJsonTicket.ttImpln ||
            installType == MasterJsonTicket.ttImplr) &&
        sn.isNotEmpty) {
      edcGetted = "${sn.startsWith("PE") ? "1" : "2"},$sn";
    } else {
      edcGetted = "";
    }

    if (sn.isEmpty || sn == "") {
      edcPenarikan = sn;
    } else if ((installType == MasterJsonTicket.ttDist ||
            installType == MasterJsonTicket.ttCm ||
            installType == MasterJsonTicket.ttPm) &&
        sn.isNotEmpty) {
      edcPenarikan = "${sn.startsWith("PE") ? "1" : "2"},$sn";
    } else {
      edcPenarikan = "";
    }

    /* debugPrint("id_ticket : $idTicket");
    debugPrint("no_ticket : $noTicket");
    debugPrint("no_lkm : $noLkm");

    //checklist
    debugPrint("purchase : ${purchase == null ? "" : json.encode(purchase)}");
    debugPrint("brizzi : ${brizzi == null ? "" : json.encode(brizzi)}");
    debugPrint("qris : ${qris == null ? "" : json.encode(qris)}");
    debugPrint("help : ${help == null ? "" : json.encode(help)}");
    debugPrint("activity : ${activity == null ? "" : json.encode(activity)}");
    debugPrint("note : ${note == null ? "" : json.encode(note)}");

    //tambahan
    debugPrint(
        "list_edc_lain : ${listEdcLain!.isEmpty ? "" : listEdcLain.join(',')}");
    debugPrint(
        "tipe_merchant : ${typeMerchant == null ? "" : typeMerchant.title.toString()}");
    debugPrint(
        "edc_utama : ${edcPrimary == null ? "" : edcPrimary.title.toString()}");
    debugPrint("keterangan : $visit");

    debugPrint("EDC : $edcGetted");

    debugPrint("EDC_pernarikan : $edcPenarikan"); */

    final Map<String, int> dataItem = {};
    if (listItem != null) {
      for (var item in listItem) {
        dataItem[item.idStock.toString()] = int.parse(item.def.toString());
      }
    }

    /* debugPrint("item : ${json.encode(dataItem)}");

    //foto
    debugPrint("merchant : $merchantImg");
    debugPrint("cashier : $cashierImg");
    debugPrint("edc : $edcImg");
    debugPrint("receipt_purchase : $purchaseImg");
    debugPrint("receipt_brizzi : $brizziImg");
    debugPrint("receipt_qris : $qrisImg");
    debugPrint("receipt_optional : $optionalImg");
    debugPrint("receipt_optional2 : $optional2Img");

    //ttd
    debugPrint("merchant_name : $merchantName");
    debugPrint("merchant_number : $merchantNumber");
    debugPrint("merchant_sign : $merchantSign");
    debugPrint("officer_name : $officerName");
    debugPrint("officer_number : $officerNumber");
    debugPrint("officer_sign : $officerSign");

    debugPrint("idStatus : $idStatus");
    debugPrint("idStatusDetail : $idStatusDetail");
    debugPrint("status_ticket : $statusTicket");
    debugPrint("merchant_open_time : $merchantOpenTime");
    debugPrint("merchant_close_time : $merchantCloseTime");
    debugPrint("merchant_address : $merchantAddress"); */

    bundleBloc.add(
      BundleSubmitted(
        idTicket: idTicket,
        noTicket: noTicket,
        noLkm: noLkm,
        purchase: json.encode(purchase),
        brizzi: json.encode(brizzi),
        qris: json.encode(qris),
        help: json.encode(help),
        activity: json.encode(activity),
        note: json.encode(note),
        anotherListEdc: listEdcLain!.isEmpty ? "" : listEdcLain.join(','),
        merchantType: typeMerchant == null ? "" : typeMerchant.title.toString(),
        edcPrimary: edcPrimary,
        description: visit,
        edc: edcGetted,
        edcWithdrawal: edcPenarikan,
        item: json.encode(dataItem),
        merchantImg: merchantImg,
        cashierImg: cashierImg,
        edcImg: edcImg,
        purchaseImg: purchaseImg,
        brizziImg: brizziImg,
        qrisImg: qrisImg,
        optionalImg: optionalImg,
        optional2Img: optional2Img,
        merchantName: merchantName,
        merchantNumber: merchantNumber,
        merchantSign: merchantSign,
        officerName: officerName,
        officerNumber: officerNumber,
        officerSign: officerSign,
        idStatus: idStatus,
        idStatusDetail: idStatusDetail,
        statusTicket: statusTicket,
        merchantOpenTime: merchantOpenTime,
        merchantCloseTime: merchantCloseTime,
        merchantAddress: merchantAddress,
      ),
    );
  }
}
