import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneLineChartWidgets extends ConsumerWidget {
  const OneLineChartWidgets(
      {super.key, required this.lineChartData, this.bgColor});

  final LineChartData lineChartData;
  final Color? bgColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PanelWidgets(
        bgColor: Colors.white.withOpacity(0.4),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 20),
              child: LineChart(
                lineChartData,
                duration: const Duration(milliseconds: 250),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
