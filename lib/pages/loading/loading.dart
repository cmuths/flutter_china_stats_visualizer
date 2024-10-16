
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/constants/app_fill_box.dart';
import 'package:flutter_china_stats_visualizer/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends ConsumerStatefulWidget {
    const Loading({super.key});

    @override
    _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<Loading> {

    @override
    void initState() {
        super.initState();
        _loadExcelData();
    }

    Future<void> _loadExcelData() async {

        // 模拟加载Excel文件
        await Future.delayed(Duration(seconds: 3)); // 模拟延迟

        // 加载完成后导航到Dashboard页面
        context.go('/main');
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child:Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            LoadingAnimationWidget.discreteCircle(
                                color: AppColors.primary,
                                size: 100
                            ),
                            AppFillBox.gapH16,
                            Text("NBSC DATA INITING...",
                                style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).textTheme.bodyLarge?.color
                                ),)
                        ],
                    ),
                )),
        );
    }

}
