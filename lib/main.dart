import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:flutter_china_stats_visualizer/theme/app_theme.dart';
import 'package:flutter_china_stats_visualizer/router/app_routes.dart';
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
                ..minSize = Size(640, 360)
                ..size = Size(1024, 540)
                ..alignment = Alignment.center
                ..show();
        });
    }
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    void setWindowEffect(WindowEffect? value) {
        Window.setEffect(
            effect: value!,
            color: Platform.isWindows ? const Color(0x22DDDDDD) : Colors.transparent,
            dark: false,
        );
        if (Platform.isMacOS) {
            Window.overrideMacOSBrightness(
                dark: false,
            );
        }else{
            Window.showWindowControls();
        }
    }

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        setWindowEffect(WindowEffect.acrylic);
        return MaterialApp.router(
            title: 'NBSC DAtA',
            theme: AppTheme.light(context),
            routerConfig: routerConfig
        );
    }
}

