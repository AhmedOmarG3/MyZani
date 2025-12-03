import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/settings/settings_cubit.dart';
import 'package:myzani/core/theme/app_theme.dart';

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
    final theme = context.appTheme;
    final settings = context.watch<SettingsCubit>().state;
    final isArabic = settings.locale.languageCode == 'ar';
    final List<String> months = isArabic
        ? const [
            'يناير',
            'فبراير',
            'مارس',
            'أبريل',
            'مايو',
            'يونيو',
            'يوليو',
            'أغسطس',
            'سبتمبر',
            'أكتوبر',
            'نوفمبر',
            'ديسمبر',
          ]
        : const [
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
              backgroundColor: theme.chartBackgroundColor,
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
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.chartMonthLabelColor,
                              fontWeight: FontWeight.w500,
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
                  getTooltipColor: (touchedSpot) => theme.chartTooltipColor,
                  tooltipBorder: BorderSide(
                    color: theme.primaryColor,
                    width: 1.w,
                  ),
                  tooltipBorderRadius: BorderRadius.circular(8.r),
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (spots) {
                    return spots.map((spot) {
                      return LineTooltipItem(
                        "${settings.currencySymbol}${spot.y.toInt()}",
                        TextStyle(
                          color: theme.primaryColor,
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
                        color: theme.greyColor,
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
                  color: theme.chartColor,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        theme.chartAreaGradientStart.withOpacity(0.3),
                        theme.chartAreaGradientEnd,
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
