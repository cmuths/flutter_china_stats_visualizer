import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppDefaults {
    static const double padding = 16.0;
    static const double borderRadius = 8.0;
    static const double inputFieldRadius = 12.0;
    static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(AppDefaults.borderRadius),
        ),
        borderSide: BorderSide.none);
    static OutlineInputBorder focusedOutlineInputBorder = outlineInputBorder
        .copyWith(borderSide: BorderSide(width: 2, color: AppColors.primary));

    static const String logo = "assets/logo/Logo.svg";
    static const String mMetricsPath = "assets/excel/M-Metrics.xlsx";
    static const int maxMenuLevel = 3;
}
