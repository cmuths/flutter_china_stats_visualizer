
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/constants/app_fill_box.dart';
import 'package:flutter_china_stats_visualizer/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget{
    const Loading({super.key});

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