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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding,
                          vertical: AppDefaults.padding,
                        ),
                        child: SafeArea(child: child),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
