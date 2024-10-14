import 'package:flutter_china_stats_visualizer/pages/loading/loading.dart';
import 'package:go_router/go_router.dart';

final routerConfig =GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Loading(),
      ),
    ]
);