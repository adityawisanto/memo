import 'package:memo/packages/packages.dart';

class MerchantAbout extends StatelessWidget {
  final MerchantArgument merchantArgument;

  const MerchantAbout({
    super.key,
    required this.merchantArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DETAIL MERCHANT",
          style: CustomTextStyle.bold(
            12.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(4.6),
            1: FlexColumnWidth(0.4),
            2: FlexColumnWidth(6),
          },
          children: [
            CustomTable.row(
              "Nama Toko",
              merchantArgument.dataTicket!.merchantName.toString(),
            ),
            CustomTable.row(
              "Alamat",
              merchantArgument.dataTicket!.address.toString(),
            ),
            CustomTable.row(
              "",
              "Lihat di Google Maps",
              withSemiColon: false,
              fontColor: CustomColorStyle.bluePrimary,
              withBold: true,
              onTap: () => CustomUrl().launchMap(
                merchantArgument.dataTicket!.address.toString(),
              ),
            ),
            CustomTable.row(
              "PIC Merchant",
              merchantArgument.dataTicket!.pic.toString(),
            ),
            CustomTable.row(
              "No. Telp",
              merchantArgument.dataTicket!.phonePic.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
