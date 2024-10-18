
import 'package:flutter_china_stats_visualizer/src/features/main_frame/screen/main_frame_screen.dart';
import 'package:flutter_china_stats_visualizer/src/features/startup_loading/screen/startup_loading_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig =GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartupLoadingScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainFrameScreen(),
      ),
    ]
);