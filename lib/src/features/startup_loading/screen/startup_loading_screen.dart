import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../constants/app_fill_box.dart';
import '../../../theme/app_colors.dart';

import '../../main_frame/repository/excel/metrics_async_repository.dart';

class StartupLoadingScreen  extends ConsumerStatefulWidget {

    const StartupLoadingScreen({super.key});
    @override
    _StartupLoadingScreenState createState() => _StartupLoadingScreenState();

}

class _StartupLoadingScreenState extends ConsumerState<StartupLoadingScreen> {

    @override
    void initState() {
        super.initState();
        SchedulerBinding.instance.addPostFrameCallback((_) {
            _loadExcelData(3);
        });
    }


    void _loadExcelData(int i) async{
        await Future.delayed(Duration(seconds: i));
        await ref.read(metricsAsyncRepositoryProvider.notifier).load();
        if(mounted){
            context.go('/main');
        }
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