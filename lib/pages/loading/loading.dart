
import 'package:flutter/material.dart';
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
                            LoadingAnimationWidget.discreteCircle(color: Colors.white,size: 100)
                        ],

                    ),
                )),
        );
    }
}