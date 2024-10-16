
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/constants/app_defaluts.dart';
import 'package:flutter_china_stats_visualizer/pages/dashboard/dashboard.dart';
import 'package:flutter_china_stats_visualizer/shared/widgets/sidemenu/sidebar.dart';

import '../shared/widgets/header.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatelessWidget {
    const EntryPoint({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.transparent,
            body: Row(
                children: [
                    const Sidebar(),
                    Expanded(
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
                                                    child: const SafeArea(child: DashBoard()),
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
