import 'package:flutter/material.dart';

class MetricsDomain {
    final IconData icon;
    final Color iconColor;
    final String value;
    final Color valueColor;
    final String name;
    final Color nameColor;

    //单位图标
    final IconData? unitIcon;

    //同比
    final String? yoy;
    final int yoyDirection;

    //环比
    final String? mom;
    final int momDirection;

    MetricsDomain(
    {required this.icon,
        required this.iconColor,
        required this.value,
        required this.valueColor,
        required this.name,
        required this.nameColor,
        this.unitIcon,
        this.yoy,
        this.yoyDirection = 1,
        this.mom,
        this.momDirection = 1});
}
