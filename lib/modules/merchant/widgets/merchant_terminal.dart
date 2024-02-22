import 'package:memo/packages/packages.dart';

class MerchantTerminal extends StatelessWidget {
  final MerchantArgument merchantArgument;

  const MerchantTerminal({
    super.key,
    required this.merchantArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DETAIL TERMINAL",
          style: CustomTextStyle.bold(
            12.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Expanded(
              child: MerchantTerminalItem(
                title: "POI",
                description: merchantArgument.dataTicket!.poi.toString(),
              ),
            ),
            Expanded(
              child: MerchantTerminalItem(
                title: "TID",
                description: merchantArgument.dataTicket!.tid.toString(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Expanded(
              child: MerchantTerminalItem(
                title: "MID",
                description: merchantArgument.dataTicket!.mid.toString(),
              ),
            ),
            Expanded(
              child: MerchantTerminalItem(
                title: "SN Baru",
                description: merchantArgument.dataTicket!.installType
                                .toString() ==
                            MasterJsonTicket.ttImpln ||
                        merchantArgument.dataTicket!.installType.toString() ==
                            MasterJsonTicket.ttImplr
                    ? merchantArgument.dataTicket!.sn.toString()
                    : "-",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Expanded(
              child: MerchantTerminalItem(
                title: "Passcode",
                description: merchantArgument.dataTicket!.passcode.toString(),
              ),
            ),
            Expanded(
              child: MerchantTerminalItem(
                title: "SN Lama",
                description: merchantArgument.dataTicket!.installType
                                .toString() ==
                            MasterJsonTicket.ttImpln ||
                        merchantArgument.dataTicket!.installType.toString() ==
                            MasterJsonTicket.ttImplr
                    ? "-"
                    : merchantArgument.dataTicket!.sn.toString(),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => CustomNavigation.intentWithData(
            context,
            MerchantM3sPage.routeName,
            merchantArgument,
          ),
          child: Text(
            "Lihat M3S Mobile",
            style: CustomTextStyle.bold(
              12.sp,
              color: CustomColorStyle.bluePrimary,
            ),
          ),
        ),
      ],
    );
  }
}
