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
    final Color? unitIconColor;

    //同比
    final String? yoy;
    final int yoyDirection;
    final Color? yoyColor;

    //环比
    final String? mom;
    final int momDirection;
    final Color? momColor;

    MetricsDomain(
    {required this.icon,
        required this.iconColor,
        required this.value,
        required this.valueColor,
        required this.name,
        required this.nameColor,
        this.unitIcon,
        this.unitIconColor,
        this.yoy,
        this.yoyColor,
        this.yoyDirection = 1,
        this.mom,
        this.momColor,
        this.momDirection = 1});
}
