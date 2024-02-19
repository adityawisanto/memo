import 'package:memo/packages/packages.dart';

class SummaryChartBarItem extends StatelessWidget {
  final int stat;
  final int totalStat;
  final double percentageStat;
  final List<SummaryChart> listChartBar;

  const SummaryChartBarItem({
    super.key,
    required this.stat,
    required this.totalStat,
    required this.percentageStat,
    required this.listChartBar,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/home/ticket_off.svg",
                  width: 14.w,
                  height: 14.h,
                  colorFilter: ColorFilter.mode(
                    CustomColorStyle.orangePrimary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "$stat of $totalStat",
                  style: CustomTextStyle.bold(
                    12.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  "${percentageStat.isNaN ? "0.0" : percentageStat}%",
                  style: CustomTextStyle.bold(
                    12.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 4,
            color: CustomColorStyle.grayPrimary.withOpacity(
              0.1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: AspectRatio(
              aspectRatio: 1.2,
              child: BarChart(
                swapAnimationDuration: Duration.zero,
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: CustomColorStyle.blackPrimary.withOpacity(
                          0.1,
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: CustomColorStyle.blackPrimary.withOpacity(
                        0.1,
                      ),
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: CustomTextStyle.medium(
                              10.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString() == "1.0"
                                ? "Done"
                                : value.toString() == "2.0"
                                    ? "DN"
                                    : value.toString() == "3.0"
                                        ? "On Progress"
                                        : value.toString() == "4.0"
                                            ? "Pending"
                                            : "",
                            style: CustomTextStyle.medium(
                              10.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  barGroups: listChartBar.map((e) {
                    return BarChartGroupData(
                      x: e.id!,
                      barRods: [
                        BarChartRodData(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                          toY: e.total!.toDouble(),
                          color: e.id.toString() == "1"
                              ? CustomColorStyle.greenPrimary
                              : e.id.toString() == "2"
                                  ? CustomColorStyle.orangePrimary
                                  : e.id.toString() == "3"
                                      ? CustomColorStyle.bluePrimary
                                      : CustomColorStyle.yellowPrimary,
                          width: 50,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
