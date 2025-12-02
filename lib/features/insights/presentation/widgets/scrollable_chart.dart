import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/colors.dart';

class ScrollableLineChart extends StatelessWidget {
  const ScrollableLineChart({super.key});

  List<FlSpot> generateSmoothSpots(List<FlSpot> originalSpots, int segments) {
    List<FlSpot> allSpots = [];
    for (int i = 0; i < originalSpots.length - 1; i++) {
      final start = originalSpots[i];
      final end = originalSpots[i + 1];
      for (int j = 0; j < segments; j++) {
        double t = j / segments;
        double x = start.x + (end.x - start.x) * t;
        double y = start.y + (end.y - start.y) * t;
        allSpots.add(FlSpot(x, y));
      }
    }
    allSpots.add(originalSpots.last);
    return allSpots;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final originalSpots = [
      FlSpot(0, 300),
      FlSpot(1, 500),
      FlSpot(2, 800),
      FlSpot(3, 1200),
      FlSpot(4, 900),
      FlSpot(5, 1400),
      FlSpot(6, 1000),
      FlSpot(7, 1600),
      FlSpot(8, 1300),
      FlSpot(9, 1700),
      FlSpot(10, 1200),
      FlSpot(11, 1900),
    ];

    final spots = generateSmoothSpots(originalSpots, 1);

    return SizedBox(
      height: 190.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: (spots.length - 1) * 50,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      int index = value.toInt();
                      if (index >= 0 && index < months.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[index],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),

              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchSpotThreshold: double.infinity,
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => const Color(0xffEBF1F1),
                  tooltipBorder: BorderSide(color: kPrimaryColor, width: 1.w),
                  tooltipBorderRadius: BorderRadius.circular(8.r),
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (spots) {
                    return spots.map((spot) {
                      return LineTooltipItem(
                        "\$${spot.y.toInt()}",
                        const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    }).toList();
                  },
                ),
                getTouchedSpotIndicator: (barData, spotIndexes) {
                  return spotIndexes.map((index) {
                    final spot = barData.spots[index];
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: kGreyColor,
                        strokeWidth: 1,
                        dashArray: [10, 7],
                      ),
                      FlDotData(show: false),
                    );
                  }).toList();
                },
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  color: const Color(0xff2f8f83),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff2f8f83).withOpacity(0.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
