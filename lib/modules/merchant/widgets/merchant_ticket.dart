import 'package:memo/packages/packages.dart';

class MerchantTicket extends StatelessWidget {
  final MerchantArgument merchantArgument;

  const MerchantTicket({
    super.key,
    required this.merchantArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(4.6),
        1: FlexColumnWidth(0.4),
        2: FlexColumnWidth(6),
      },
      children: [
        CustomTable.row(
          "Nomor Tiket",
          merchantArgument.dataTicket!.idSubTicket.toString(),
        ),
        CustomTable.row(
          "Status Tiket",
          MasterJsonTicket()
              .statusWithText(
                merchantArgument.dataTicket!.status.toString(),
              )
              .toString(),
        ),
        CustomTable.row(
          "Kategori",
          MasterJsonTicket()
              .typeWithText(
                merchantArgument.dataTicket!.installType.toString(),
              )
              .toString(),
        ),
        CustomTable.row(
          "Prioritas Tiket",
          MasterJsonTicket()
              .priorityWithText(
                merchantArgument.dataTicket!.priority.toString(),
              )
              .toString(),
        ),
        CustomTable.row(
          "Keterangan Kunjungan",
          merchantArgument.dataTicket!.note.toString(),
        ),
      ],
    );
  }
}
