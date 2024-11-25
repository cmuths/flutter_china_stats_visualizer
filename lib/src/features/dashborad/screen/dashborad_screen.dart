import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/one_line_chart_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/one_metrics_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/three_metrics_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/constants/app_defaluts.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/screen/image_view_wdiget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_fill_box.dart';
import '../../../theme/app_colors.dart';
import '../domain/metrics_domain.dart';

class DashboradScreen extends ConsumerStatefulWidget {
  const DashboradScreen({super.key});

  @override
  ConsumerState createState() => _DashboradScreenState();
}

class _DashboradScreenState extends ConsumerState<DashboradScreen> {
  @override
  Widget build(BuildContext context) {
    List<MetricsDomain> metricsList = [];
    metricsList.add(MetricsDomain(
        icon: CupertinoIcons.cart_fill_badge_plus,
        iconColor: Colors.black,
        value: '100.10',
        valueColor: Colors.black87,
        name: 'CPI',
        nameColor: Colors.black54));
    metricsList.add(MetricsDomain(
        icon: CupertinoIcons.airplane,
        iconColor: Colors.black,
        value: '104.12',
        valueColor: Colors.black87,
        name: 'PPI',
        nameColor: Colors.black54));
    metricsList.add(MetricsDomain(
        icon: CupertinoIcons.person_alt,
        iconColor: Colors.black,
        value: '50.10',
        valueColor: Colors.black87,
        name: 'PMI',
        nameColor: Colors.black54));

    List<MetricsDomain> metricsLists = [];
    metricsLists.add(MetricsDomain(
        icon: CupertinoIcons.money_dollar_circle_fill,
        iconColor: Colors.white,
        value: '78680.28',
        valueColor: Colors.white,
        name: '房地产投资',
        nameColor: Colors.white60));
    metricsLists.add(MetricsDomain(
        icon: CupertinoIcons.house_alt_fill,
        iconColor: Colors.white,
        value: '56050.75',
        valueColor: Colors.white,
        name: '新开工施工面积',
        nameColor: Colors.white60));

    var demoM = MetricsDomain(
        icon: CupertinoIcons.paintbrush_fill,
        iconColor: Colors.white,
        value: '135663.12',
        valueColor: Colors.white,
        name: '国家财政收入',
        nameColor: Colors.white60,
        unitIcon: CupertinoIcons.money_yen,
        mom: '2.6',
        momDirection: -1,
        yoy: '5.6',
        yoyDirection: 1);

    /////mock chart data
    LineTouchData lineTouchData1 = LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
      ),
    );
    FlGridData gridData = const FlGridData(show: false);

    SideTitles bottomTitles = SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );

    SideTitles leftTitles() => SideTitles(
          getTitlesWidget: leftTitleWidgets,
          showTitles: true,
          interval: 1,
          reservedSize: 40,
        );

    FlTitlesData titlesData1 = FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
    );

    FlBorderData borderData = FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
        left: const BorderSide(color: Colors.transparent),
        right: const BorderSide(color: Colors.transparent),
        top: const BorderSide(color: Colors.transparent),
      ),
    );

    List<LineChartBarData> lineBarsData1 = [lineChartBarData1_1];

    LineChartData sampleData1 = LineChartData(
      lineTouchData: lineTouchData1,
      gridData: gridData,
      titlesData: titlesData1,
      borderData: borderData,
      lineBarsData: lineBarsData1,
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
    );

    return Padding(
      padding: EdgeInsets.all(AppDefaults.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    PanelWidgets(child: ImageViewWdiget()),
                    AppFillBox.gapH16,
                    OneLineChartWidgets(lineChartData: sampleData1)
                  ],
                ),
              ),
              AppFillBox.gapW16,
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ThreeMetricsWidgets(
                        metrics: metricsList,
                        bgColor: Color(0xFFF4C948),
                        explain: '2024-09',
                      ),
                      AppFillBox.gapH16,
                      ThreeMetricsWidgets(
                        metrics: metricsLists,
                        bgColor: Color(0xFFEF7C38),
                        explain: '2024-10',
                      ),
                      AppFillBox.gapH16,
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: AppDefaults.padding,
                        runSpacing: AppDefaults.padding,
                        children: [
                          OneMetricsWidgets(
                            metricsDomain: demoM,
                            bgColor: Color(0xFF4562D5),
                          ),
                          OneMetricsWidgets(
                            metricsDomain: demoM,
                            bgColor: Color(0xFF4562D5),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Color(0xFFEF7C3F),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );
}
