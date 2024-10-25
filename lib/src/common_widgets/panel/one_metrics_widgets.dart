import 'package:flutter/cupertino.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/domain/metrics_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneMetricsWidgets extends ConsumerWidget {
    const OneMetricsWidgets(
    {super.key, required this.metricsDomain, this.bgColor});

    final MetricsDomain metricsDomain;
    final Color? bgColor;

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        return PanelWidgets(child: Column(), bgColor: bgColor);
    }
}
