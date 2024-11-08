import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/panel/panel_widgets.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/domain/metrics_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_fill_box.dart';
import '../../utils/number_helper.dart';

class OneMetricsWidgets extends ConsumerWidget {
  const OneMetricsWidgets(
      {super.key, required this.metricsDomain, this.bgColor});

  final MetricsDomain metricsDomain;
  final Color? bgColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> valueFormatNum =
        NumberHelper.splitIntegerAndDecimal(metricsDomain.value);
    return PanelWidgets(
      bgColor: bgColor,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFillBox.gapH24,
            Icon(
              metricsDomain.icon,
              size: 45,
              color: metricsDomain.iconColor,
            ),
            AppFillBox.gapH12,
            Text(
              metricsDomain.name,
              style: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: metricsDomain.valueColor,
              ),
            ),
            AppFillBox.gapH16,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: valueFormatNum[0],
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: metricsDomain.valueColor,
                    ),
                  ),
                  if (valueFormatNum.length >= 2)
                    TextSpan(
                      text: '.${valueFormatNum[1]}',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: metricsDomain.valueColor,
                      ),
                    )
                ])),
                if (metricsDomain.unitIcon != null)
                  Icon(
                    metricsDomain.unitIcon,
                    size: 25,
                    color:
                        metricsDomain.unitIconColor ?? metricsDomain.valueColor,
                  ),
              ],
            ),
            AppFillBox.gapH8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ..._getCompareWidget('同比', metricsDomain.momDirection,
                    metricsDomain.mom, metricsDomain.momColor),
                AppFillBox.gapW16,
                ..._getCompareWidget('环比', metricsDomain.yoyDirection,
                    metricsDomain.yoy, metricsDomain.yoyColor)
              ],
            ),
            AppFillBox.gapH16
          ],
        ),
      ),
    );
  }

  List<Widget> _getCompareWidget(
      String type, int direction, String? value, Color? unitColor) {
    return [
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: value,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: metricsDomain.valueColor,
          ),
        ),
        TextSpan(
          text: '%',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: metricsDomain.valueColor,
          ),
        ),
        TextSpan(
          text: '  $type',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: metricsDomain.valueColor,
          ),
        )
      ])),
      AppFillBox.gapW4,
      if (direction > 0)
        Icon(
          CupertinoIcons.arrowshape_turn_up_right_fill,
          size: 15,
          color: unitColor ?? Colors.green,
        )
      else
        Transform.rotate(
          angle: pi,
          child: Icon(
            CupertinoIcons.arrowshape_turn_up_left_fill,
            size: 15,
            color: unitColor ?? Colors.red.withOpacity(0.7),
          ),
        ),
    ];
  }
}
