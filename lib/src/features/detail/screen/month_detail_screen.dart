import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthDetailScreen extends ConsumerStatefulWidget
{
    const MonthDetailScreen({super.key});

    @override
    ConsumerState createState() => _MonthDetailScreenState();
}

class _MonthDetailScreenState extends ConsumerState<MonthDetailScreen>
{
    @override
    Widget build(BuildContext context)
    {
        return Container(
            child: Text("detail"),
        );
    }
}
