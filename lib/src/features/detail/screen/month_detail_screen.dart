import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_defaluts.dart';
import '../../../constants/app_fill_box.dart';
import 'metrics_tree_screen.dart';

class MonthDetailScreen extends ConsumerStatefulWidget {
  const MonthDetailScreen({super.key});

  @override
  ConsumerState createState() => _MonthDetailScreenState();
}

class _MonthDetailScreenState extends ConsumerState<MonthDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(AppDefaults.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: MetricsTreeScreen(),
                ),
                AppFillBox.gapW16,
                Expanded(
                  flex: 5,
                  child: Text("data"),
                ),
              ],
            )
          ],
        ));
  }
}
