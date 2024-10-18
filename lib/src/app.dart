import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';

import 'routing/app_routes.dart';
import 'theme/app_theme.dart';

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