import 'package:memo/packages/packages.dart';

class SummaryPieItem extends StatelessWidget {
  final String category;
  final double valueOut;
  final double valueIn;
  final String titleIn;
  final String titleOut;
  final Color color;

  const SummaryPieItem({
    super.key,
    required this.category,
    required this.valueOut,
    required this.valueIn,
    required this.titleIn,
    required this.titleOut,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            category,
            style: CustomTextStyle.bold(
              14.sp,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  swapAnimationDuration: const Duration(
                    milliseconds: 750,
                  ),
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: valueOut,
                        radius: 30,
                        showTitle: false,
                        color: CustomColorStyle.baseLayout,
                      ),
                      PieChartSectionData(
                        value: valueIn,
                        radius: 30,
                        showTitle: false,
                        color: color,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleIn,
                      style: CustomTextStyle.bold(
                        16.sp,
                      ),
                    ),
                    Text(
                      titleOut,
                      style: CustomTextStyle.medium(
                        12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
