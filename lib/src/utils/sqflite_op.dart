import 'package:flutter_china_stats_visualizer/src/utils/sqflite_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class SqFliteOp<T>{
    Future<int> insert  (T t);
    Future<int> delete (T t);
    Future<List<T>> query(T t);
    Future<int> update(T t);
}