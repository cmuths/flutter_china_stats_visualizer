import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/three_metrics_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/constants/app_defaluts.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/screen/image_view_wdiget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_fill_box.dart';
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

        return Padding(
            padding: EdgeInsets.all(AppDefaults.padding),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Expanded(
                                flex: 6,
                                child: Column(
                                    children: [PanelWidgets(child: ImageViewWdiget())],
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
                                    ],
                                )),
                        ],
                    ),
                ]));
    }
}
