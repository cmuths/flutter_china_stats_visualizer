

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



class SqFliteHelper {

    static Database? _database;

    static Future<Database> get database async{
        _database ??= await _initdb();
        return _database!;
    }

    static Future<Database> _initdb() async{
        if( Platform.isLinux || Platform.isWindows){
            sqfliteFfiInit();
            final databaseFactory = databaseFactoryFfi;
            final appDocumentsDir = await getApplicationDocumentsDirectory();
            final dbPath = join(appDocumentsDir.path, "databases", "metrics.db");
            return  await databaseFactory.openDatabase(
                dbPath,
                options: OpenDatabaseOptions(
                    version: 1,
                    onCreate: (db,_){
                        _onCreate(db );
                    }
                )
            );
        }else if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS){
            final documentsDirectory = await getApplicationDocumentsDirectory();
            final path = join(documentsDirectory.path,"metrics.db");
            return await openDatabase(
                path,
                version: 1,
                onCreate: (db,_){
                    _onCreate(db );
                }
            );
        }

        throw Exception("database init error ! unsupported platform !");

    }

    static Future<void> _onCreate(Database database) async{
       await database.execute(""" 
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
              metrics_unit_name TEXT,
            )
        """);
    }

}