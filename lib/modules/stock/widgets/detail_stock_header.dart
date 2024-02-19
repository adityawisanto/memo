import 'package:memo/packages/packages.dart';

class DetailStockHeader extends StatelessWidget {
  final String isEdc;

  const DetailStockHeader({
    super.key,
    required this.isEdc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColorStyle.orangePrimary,
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
                "No",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.white,
                ),
              ),
              Text(
                "SN/Kode",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.white,
                ),
              ),
              Text(
                "Tanggal",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.white,
                ),
              ),
              Text(
                "Status",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
