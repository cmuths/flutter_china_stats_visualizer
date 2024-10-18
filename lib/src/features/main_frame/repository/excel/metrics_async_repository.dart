import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_china_stats_visualizer/src/features/main_frame/domain/metrics_define_domain.dart';

import '../../../../constants/app_defaluts.dart';

part 'metrics_async_repository.g.dart';

@riverpod
class MetricsAsyncRepository extends _$MetricsAsyncRepository {
    @override
    FutureOr<List<MetricsDefineDomain>> build() async {
        return [];
    }

    Future<void> load() async{
      state = const AsyncLoading(); // 设置加载状态
      try {
        /// 后台加载
        List<MetricsDefineDomain> list = await compute(_loadExcel, 12);
        state =  AsyncData(list);
      }catch(e){
        state = AsyncError(e, StackTrace.current); // 设置错误
      }
    }


    /// 加载EXCEL中的指标定义数据
    List<MetricsDefineDomain> _loadExcel(int cosNum) {
        var bytes = File(AppDefaults.mMetricsPath).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        var sheet = excel.tables[excel.tables.keys.first];
        List<MetricsDefineDomain> list = [];
        if(sheet != null){
            for (var row in sheet.rows.skip(1)) { // 跳过标题行
                list.add(
                    MetricsDefineDomain(
                        row[0]?.value.toString() ?? "",
                        row[1]?.value.toString() ?? "",
                        row[2]?.value.toString() ?? "",
                        row[3]?.value.toString() ?? "",
                        row[4]?.value.toString() ?? "",
                        row[5]?.value.toString() ?? "",
                        row[6]?.value.toString() ?? "",
                        row[7]?.value.toString() ?? "",
                        row[8]?.value.toString() ?? "",
                        row[9]?.value.toString() ?? "",
                        row[10]?.value.toString() ?? "",
                        row[11]?.value.toString() ?? "",
                    )
                );
            } 
        }
        return list;
    }
}