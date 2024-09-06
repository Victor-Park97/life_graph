import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_graph/util/app_color.dart';
import 'package:life_graph/views/home/components/life_graph/life_graph_controller.dart';

class LifeGraph extends StatelessWidget {
  const LifeGraph({super.key, required this.controller});

  final LifeGraphController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: GetX<LifeGraphController>(
        init: controller,
        builder: (controller) {
          return LineChart(
            LineChartData(
              gridData: const FlGridData(
                horizontalInterval: 5,
                verticalInterval: 2,
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: false,
                  color: AppColor.neutral[900],
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                      radius: 4,
                      color: AppColor.neutral[900]!,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    ),
                  ),
                  belowBarData: BarAreaData(show: false),
                  spots: controller.pointList
                      .map((point) => FlSpot(point.x.toDouble(), point.y.toDouble()))
                      .toList(),
                ),
              ],
              borderData: FlBorderData(show: true),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30.h,
                    interval: 2,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30.h,
                    interval: 5,
                  ),
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
          );
        },
      ),
    );
  }
}
