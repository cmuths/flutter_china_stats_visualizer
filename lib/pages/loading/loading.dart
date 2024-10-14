
import 'package:flutter/material.dart';

class Loading extends StatelessWidget{
    const Loading({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(child: SizedBox(width: 10,),),
        );
    }
}