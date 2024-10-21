
import 'package:flutter_china_stats_visualizer/src/features/main_frame/domain/metrics_define_domain.dart';
import 'package:flutter_china_stats_visualizer/src/utils/logger_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../main_frame/repository/db/metrics_define_repository.dart';
import '../../main_frame/repository/excel/metrics_async_repository.dart';

part 'startup_service.g.dart';

class StartUpService {
    final Ref ref;
    StartUpService(this.ref);

    Future<void> initData() async{
        try {
            loggerNoStack.i("message");
            final metricsExcelProvider = ref.read(
                metricsAsyncRepositoryProvider.notifier);
            final metricsDefineDbProvider = ref.read(metricsDefineDbOpProvider);
            final List<MetricsDefineDomain> list = await metricsExcelProvider
                .load();
            await metricsDefineDbProvider.create();
            await metricsDefineDbProvider.deleteAll();
            await metricsDefineDbProvider.batchInsert(list);
        }catch(e){
            logger.e("initData method error!",error: e);
        }
    }
}

@riverpod
StartUpService startUpService (StartUpServiceRef ref){
return  StartUpService(ref);
}