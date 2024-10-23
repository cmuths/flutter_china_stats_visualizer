
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/common_widgets/sidemenu/sidebar_menu.dart';

import '../../../common_widgets/sidemenu/sidebar.dart';
import '../../../constants/app_defaluts.dart';

class MainFrameScreen extends StatelessWidget {
    const MainFrameScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    const SidebarMenu(),                    Expanded(
                        child: Column(
                            children: [
                                Expanded(
                                    child: ConstrainedBox(
                                        constraints: const BoxConstraints(maxWidth: 1360),
                                        child: ListView(
                                            children: [
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppDefaults.padding *
                                                            1.5,
                                                    ),
                                                    child: const SafeArea(child:  SizedBox(height: 24)),
                                                ),
                                            ],
                                        ),
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