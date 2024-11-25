import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/domain/metrics_domain.dart';
import 'package:flutter_china_stats_visualizer/src/utils/number_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_fill_box.dart';

class ThreeMetricsWidgets extends ConsumerWidget {
  ThreeMetricsWidgets(
      {super.key, this.bgColor, required this.metrics, this.explain});

  Color? bgColor;
  List<MetricsDomain> metrics;
  String? explain = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 400),
      child: PanelWidgets(
        bgColor: bgColor,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                metrics.length,
                (index) {
                  var metric = metrics[index];
                  List<String> valueFormatNum =
                      NumberHelper.splitIntegerAndDecimal(metric.value);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppFillBox.gapH36,
                      Icon(
                        metric.icon,
                        size: 60,
                        color: metric.iconColor,
                      ),
                      AppFillBox.gapH24,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: valueFormatNum[0],
                              style: GoogleFonts.lato(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: metric.valueColor,
                              ),
                            ),
                            if (valueFormatNum.length >= 2)
                              TextSpan(
                                text: '.${valueFormatNum[1]}',
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: metric.valueColor,
                                ),
                              )
                          ],
                        ),
                      ),
                      Text(
                        metric.name,
                        style: GoogleFonts.notoSansSc(
                          fontSize: 14,
                          color: metric.nameColor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      AppFillBox.gapH16,
                    ],
                  );
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                explain ?? "",
                style: GoogleFonts.notoSansSc(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ConstrainedBox;
  }
}
