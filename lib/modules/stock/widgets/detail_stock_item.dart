import 'package:memo/packages/packages.dart';

class DetailStockItem extends StatelessWidget {
  final String isEdc;
  final DataInventory dataInventory;
  final int index;

  const DetailStockItem({
    super.key,
    required this.isEdc,
    required this.dataInventory,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.6),
          1: FlexColumnWidth(2.6),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              Text(
                isEdc == "EDC P1" || isEdc == "EDC P2"
                    ? "${index + 1}"
                    : dataInventory.qty.toString(),
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
              Text(
                dataInventory.sn.toString(),
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
              Text(
                CustomDate.formatDate(
                  dataInventory.date.toString(),
                  format: "yyyy-mm-dd",
                ),
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
              Text(
                dataInventory.status.toString() == "ready"
                    ? "Siap digunakan"
                    : dataInventory.status.toString() == "pull"
                        ? "Penarikan"
                        : dataInventory.status.toString(),
                style: CustomTextStyle.regular(
                  10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
