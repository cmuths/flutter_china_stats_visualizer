/*
 * @Author: lihuiyong1 lihuiyong1@newhope.com
 * @Date: 2024-10-18 15:38:13
 * @LastEditors: lihuiyong1 lihuiyong1@newhope.com
 * @LastEditTime: 2024-10-18 17:11:40
 * @FilePath: \flutter_china_stats_visualizer\lib\src\features\main_frame\repository\excel\metrics_async_repository.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:io';
import 'dart:isolate';
import 'package:excel/excel.dart';
import 'package:flutter_china_stats_visualizer/src/utils/logger_helper.dart';
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

    Future<List<MetricsDefineDomain>> load() async {
        List<MetricsDefineDomain> rlist = [];
        try {
            /// 后台加载
            LoadExcel loadExcel = LoadExcel();
            rlist =  await loadExcel.load();
        } catch (e) {
            logger.e("load excel error!",error: e);
        }
        return rlist;
    }
}



class LoadExcel{

    Future<List<MetricsDefineDomain>> load() async{
        List<MetricsDefineDomain> rlist = [];
        //创建一个 ReceivePort
        ReceivePort receivePort = ReceivePort();
        await Isolate.spawn(_loadExcel, receivePort.sendPort);
        await for (var value in receivePort) {
            if (value is List) {
                rlist =  value.map((e)=>MetricsDefineDomain.fromJson(e)).toList();
                break;
            }
        }
        return rlist;
    }

    static Future<void> _loadExcel(SendPort sendPort) async{
        // ReceivePort port = ReceivePort();
        // sendPort.send(port.sendPort);
        loggerNoStack.i(" start load excel!");
        var bytes = await File(AppDefaults.mMetricsPath).readAsBytes();
        var excel = Excel.decodeBytes(bytes);
        var sheet = excel.tables[excel.tables.keys.first];
        List<Map<String,dynamic>> list = [];
        if (sheet != null) {
            for (var row in sheet.rows.skip(1)) {
                // 跳过标题行
                list.add(
                    MetricsDefineDomain(
                        metricsLevel1Name:  row[0]?.value.toString() ?? "",
                        metricsLevel1Code:  row[1]?.value.toString() ?? "",
                        metricsLevel2Name:  row[2]?.value.toString() ?? "",
                        metricsLevel2Code:  row[3]?.value.toString() ?? "",
                        metricsLevel3Name:  row[4]?.value.toString() ?? "",
                        metricsLevel3Code:  row[5]?.value.toString() ?? "",
                        metricsName:  row[6]?.value.toString() ?? "",
                        metricsCode:  row[7]?.value.toString() ?? "",
                        metricsType:  row[8]?.value.toString() ?? "",
                        metricsTypeName:  row[9]?.value.toString() ?? "",
                        metricsUnit:  row[10]?.value.toString() ?? "",
                        metricsUnitName:  row[11]?.value.toString() ?? "",
                        id: 0).toJson()
                );
            }
        }
        loggerNoStack.i("end load excel, rows : ${list.length} ");
        sendPort.send(list);
    }
}






