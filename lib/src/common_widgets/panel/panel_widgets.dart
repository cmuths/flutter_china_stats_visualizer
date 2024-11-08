import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_defaluts.dart';
import '../../theme/app_colors.dart';

class PanelWidgets extends ConsumerStatefulWidget {
  PanelWidgets({super.key, required this.child, this.bgColor});

  final Widget child;
  Color? bgColor;

  @override
  ConsumerState createState() => _PanelWidgetsState();
}

class _PanelWidgetsState extends ConsumerState<PanelWidgets> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        transform: Matrix4.identity()..scale(_isHovered ? 1.01 : 1.0),
        curve: Curves.elasticOut,
        child: Container(
          decoration: BoxDecoration(
            color: widget.bgColor ?? AppColors.bgSecondayLight,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5, // 阴影扩散半径
                blurRadius: 10, // 阴影模糊程度
                offset: const Offset(0, 2), // 阴影偏移量
              )
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
