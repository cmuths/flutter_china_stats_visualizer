import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_fill_box.dart';

class SidebarMenu extends ConsumerStatefulWidget {
    const SidebarMenu({super.key});

    @override
    _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends ConsumerState
    with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation<double> _heightAnimation;
    late Animation<double> _sizeAnimation;

    @override
    void initState() {
        super.initState();
        _controller = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 800),
        );

        ///多段动画
        // // 使用 Interval 将动画分成两个阶段
        // final expandAnimation = CurvedAnimation(
        //     parent: _controller,
        //     curve: Interval(0.0, 0.6, curve: Curves.easeInOut), // 放大阶段，占据动画总时长的前 50%
        // );
        //
        // final shrinkAnimation = CurvedAnimation(
        //     parent: _controller,
        //     curve: Interval(0.6, 1.0, curve: Curves.easeInOut), // 缩小阶段，占据动画总时长的后 50%
        // );
        //
        // final expandTween = Tween<double>(begin: 100.0, end: 300.0)
        //     .chain(CurveTween(curve: expandAnimation.curve));
        // final shrinkTween = Tween<double>(begin: 300.0, end: 240.0)
        //     .chain(CurveTween(curve: shrinkAnimation.curve));
        //
        // _animation = TweenSequence<double>([
        //         TweenSequenceItem(tween: expandTween, weight: 60.0),
        //         TweenSequenceItem(tween: shrinkTween, weight: 40.0),
        //     ]).animate(_controller)
        // ..addListener(()
        //     {
        //         setState(()
        //             {
        //             }
        //         );
        //     }
        // )
        // ..addStatusListener((status)
        //     {
        //         if (status == AnimationStatus.completed)
        //         {
        //             setState(()
        //                 {
        //                     _isExpanded = true;
        //                 }
        //             );
        //         }
        //     }
        // );

        _heightAnimation = Tween<double>(begin: 100.0, end: 230.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticOut,
            ),
        )..addListener(() {
                setState(() {});
            });

        _sizeAnimation = Tween<double>(begin: 0.0, end: 30.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticOut,
            ),
        );

        // 在 UI 初始化完成后触发动画
        WidgetsBinding.instance.addPostFrameCallback((_) {
                _controller.forward();
            });
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                            height: _heightAnimation.value,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                        Color(0xFF4562D5).withAlpha(230),
                                        Color(0xFF4562D5).withAlpha(200),
                                        Color(0xFF4562D5).withAlpha(230)
                                    ]),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 5, // 阴影扩散半径
                                        blurRadius: 10, // 阴影模糊程度
                                        offset: const Offset(0, 2), // 阴影偏移量
                                    )
                                ]),
                            child: Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                        AppFillBox.gapH24,
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Expanded(
                                                child: IconButton(
                                                    icon: Icon(
                                                        CupertinoIcons.house_fill,
                                                        size: _sizeAnimation.value,
                                                    ),
                                                    onPressed: () {},
                                                    color: Colors.white,
                                                )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Expanded(
                                                child: IconButton(
                                                    icon: Icon(
                                                        CupertinoIcons.chart_bar_circle_fill,
                                                        size: _sizeAnimation.value,
                                                    ),
                                                    onPressed: () {},
                                                    color: Colors.white,
                                                )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Expanded(
                                                child: IconButton(
                                                    icon: Icon(
                                                        CupertinoIcons.square_split_2x2_fill,
                                                        size: _sizeAnimation.value,
                                                    ),
                                                    onPressed: () {},
                                                    color: Colors.white,
                                                )),
                                        ),
                                        AppFillBox.gapH24,
                                    ],
                                )),
                        )
                    ])));
    }
}