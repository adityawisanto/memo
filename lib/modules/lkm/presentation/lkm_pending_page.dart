import 'package:intl/intl.dart';
import 'package:memo/packages/packages.dart';

class LkmPendingPage extends StatefulWidget {
  static const routeName = "/lkm_pending";

  final LkmArgument lkmArgument;

  const LkmPendingPage({
    super.key,
    required this.lkmArgument,
  });

  @override
  State<LkmPendingPage> createState() => _LkmPendingPageState();
}

class _LkmPendingPageState extends State<LkmPendingPage> {
  final customPreferences = locator<CustomPreferences>();

  final clockOpen = TextEditingController();
  final clockClose = TextEditingController();
  final address = TextEditingController();
  final description = TextEditingController();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  MasterDropdownLkmMerchant? merchantType;

  bool? bca = false;
  bool? bni = false;
  bool? cimb = false;
  bool? mandiri = false;
  bool? ocbc = false;

  List<String> anotherEdc = [];

  Future<void> back() async {
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
  }

  @override
  void dispose() {
    clockOpen.dispose();
    clockClose.dispose();
    address.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  void initState() {
    clockOpen.text = widget.lkmArgument.dataTicket!.openHours.toString();
    clockClose.text = widget.lkmArgument.dataTicket!.closeHours.toString();
    address.text = widget.lkmArgument.dataTicket!.address.toString();
    checkIntroLkmPending(
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
        "Isi LKM",
        onTap: () => back(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
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
              key: keyIntroduction[0],
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
              key: keyIntroduction[1],
              controller: address,
              title: "Alamat Merchant",
            ),
            SizedBox(
              height: 16.h,
            ),
            LkmTypeMerchant(
              key: keyIntroduction[2],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              key: keyIntroduction[3],
              children: [
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
              ],
            ),
            LkmTextInput(
              key: keyIntroduction[4],
              controller: description,
              title: "Keterangan Kunjungan",
              withMultiline: true,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              key: keyIntroduction[5],
              onPressed: () => CustomNavigation.intentWithData(
                context,
                EvidencePage.routeName,
                EvidenceArgument(
                  lkmArgument: widget.lkmArgument,
                  purchase: null,
                  brizzi: null,
                  qris: null,
                  edcComplete: null,
                  activity: null,
                  note: null,
                  snEdcP1: null,
                  snEdcP2: null,
                  edcType: "",
                  sn: "",
                  listItem: null,
                  clockOpen: clockOpen.text,
                  clockClose: clockClose.text,
                  address: address.text,
                  merchantType: merchantType,
                  anotherEdc: anotherEdc,
                  visit: description.text,
                ),
              ),
              label: "Selanjutnya",
            ),
          ],
        ),
      ),
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
}
