import 'package:flutter/cupertino.dart';
import 'package:flutter_china_stats_visualizer/src/features/dashborad/screen/dashborad_screen.dart';
import 'package:flutter_china_stats_visualizer/src/features/detail/screen/month_detail_screen.dart';
import 'package:flutter_china_stats_visualizer/src/features/main_frame/screen/main_frame_screen.dart';
import 'package:flutter_china_stats_visualizer/src/features/report/screen/report_screen.dart';
import 'package:flutter_china_stats_visualizer/src/features/startup_loading/screen/startup_loading_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const StartupLoadingScreen(),
    ),
    ShellRoute(
      navigatorKey: _sectionNavigatorKey,
      builder: (context, state, child) {
        return MainFrameScreen(
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboradScreen(),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) => const ReportScreen(),
        ),
        GoRoute(
          path: '/detail',
          builder: (context, state) => const MonthDetailScreen(),
        ),
      ],
    ),
    // StatefulShellRoute.indexedStack(
    //     builder: (context, state, navigationShell) {
    //       return MainFrameScreen(navigationShell: navigationShell);
    //     },
    //     branches: [
    //       StatefulShellBranch(routes: <RouteBase>[
    //         GoRoute(
    //           path: '/dashboard',
    //           builder: (context, state) => const DashboradScreen(),
    //         )
    //       ]),
    //       StatefulShellBranch(routes: <RouteBase>[
    //         GoRoute(
    //             path: '/report',
    //             builder: (context, state) => const ReportScreen())
    //       ]),
    //       StatefulShellBranch(routes: <RouteBase>[
    //         GoRoute(
    //             path: '/detail',
    //             builder: (context, state) => const MonthDetailScreen())
    //       ])
    //     ])
  ],
);
