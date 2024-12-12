import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/sidemenu/sidebar_menu.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/screen/dashborad_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_defaluts.dart';

class MainFrameScreen extends StatelessWidget {
  const MainFrameScreen({super.key, required this.child});

  // final StatefulNavigationShell navigationShell;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SidebarMenu(),
          ),
          Expanded(
            child:SafeArea(
              child: LayoutBuilder(
                builder: (ctx, size) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: size.maxWidth,
                      height: size.maxHeight,
                      constraints: const BoxConstraints(
                        minHeight: 750,
                      ),
                      padding: const EdgeInsets.all(AppDefaults.padding),
                      child: child,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
