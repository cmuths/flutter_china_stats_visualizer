import 'package:flutter_china_stats_visualizer/src/features/main_frame/domain/metrics_define_domain.dart';
import 'package:flutter_china_stats_visualizer/src/utils/sqflite_helper.dart';
import 'package:flutter_china_stats_visualizer/src/utils/sqflite_op.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'metrics_define_repository.g.dart';

class MetricsDefineRepository extends SqFliteOp<MetricsDefineDomain>{
    final String _table = "metrics_define";

    @override
    Future<int> delete(MetricsDefineDomain t) async {
        final db = await SqFliteHelper.database;
        return  await db.delete(_table,where: "id = ?",whereArgs: [t.id]);
    }

    @override
    Future<int> insert(MetricsDefineDomain t)  async{
        final db = await SqFliteHelper.database;
        return  await db.insert(_table,t.toMapWithOutId(),conflictAlgorithm: ConflictAlgorithm.replace);
    }

    @override
    Future<List<MetricsDefineDomain>> query(MetricsDefineDomain t) async {
        final db = await SqFliteHelper.database;
        List<Map<String, dynamic>> maps =  await db.query(_table,where: "id = ?",whereArgs: [t.id]);
        return maps.map((element)=>MetricsDefineDomain.fromMap(element)).toList();
    }

    @override
    Future<int> update(MetricsDefineDomain t) async {
        final db = await SqFliteHelper.database;
        return await db.update(_table,t.toMap(),where: "id = ?",whereArgs: [t.id]);
    }

    Future<void> deleteAll() async{
        final db = await SqFliteHelper.database;
        await db.delete(_table);
    }

    Future<void> batchInsert(List<MetricsDefineDomain> list) async{
        list ??= [];
        if(list.isNotEmpty){
            final db = await SqFliteHelper.database;
            final batch = db.batch();
            for(final MetricsDefineDomain defineDomain in list){
                batch.insert(_table, defineDomain.toMapWithOutId());
            }
            await batch.commit();
        }
    }

    Future<void> create() async{
        final db = await SqFliteHelper.database;
        await db.execute(""" 
            create table if not exists metrics_define(
              id INTEGER  primary key AUTOINCREMENT,
              metrics_level1_name TEXT,
              metrics_level1_code TEXT,
              metrics_level2_name TEXT,
              metrics_level2_code TEXT,
              metrics_level3_name TEXT,
              metrics_level3_code TEXT,
              metrics_name TEXT,
              metrics_code TEXT,
              metrics_type TEXT,
              metrics_type_name TEXT,
              metrics_unit TEXT,
              metrics_unit_name TEXT
            )
        """);
    }
}

@riverpod
MetricsDefineRepository metricsDefineDbOp (MetricsDefineDbOpRef ref) {
  return MetricsDefineRepository();
}
