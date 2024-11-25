import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_china_stats_visualizer/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();

    await Window.initialize();

    if (Platform.isWindows) {
        await Window.hideWindowControls();
    }
    runApp( const ProviderScope(child: MyApp(),));
    if (Platform.isWindows) {
        doWhenWindowReady(() {
                appWindow
                    ..minSize = Size(1336, 768)
                    ..size = Size(1336, 768)
                    ..alignment = Alignment.center
                ..show();
            });
    }
}



