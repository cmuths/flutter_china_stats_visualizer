import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_china_stats_visualizer/src/features/main_frame/domain/menu_item_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/app_defaluts.dart';
import '../../../constants/menu_icon_config.dart';

part 'menu_async_repository.g.dart';

@Riverpod(keepAlive: true)
class MenuAsyncRepository extends _$MenuAsyncRepository {
    @override
    FutureOr<List<MenuItem>> build() async {
        return [];
    }

    Future<void> loadExcelData() async {
        state = const AsyncLoading(); // 设置加载状态
        try {
            List<MenuItem> menus = await compute(_loadMenu, 1);
            state =  AsyncData(menus);
        }catch(e){
            state = AsyncError(e, StackTrace.current); // 设置错误
        }
    }

    List<MenuItem> _loadMenu(int i){
        var bytes = File(AppDefaults.mMetricsPath).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        var sheet = excel.tables[excel.tables.keys.first];
        if (sheet == null) {
            return [];
        }else{
            Map<String, MenuItem> menuMap = {};
            for (var row in sheet.rows.skip(1)) { // 跳过标题行
                _addMenuItem(menuMap, row);
            }
            return menuMap.values.toList();
        }
    }

    void _addMenuItem(Map<String, MenuItem> menuMap, List<Data?> row) {
        MenuItem? parent;
        for (int level = 0; level < AppDefaults.maxMenuLevel; level++) {
            var value = row[level]?.value?.toString() ?? '';
            if (value.isEmpty) {
                if (parent != null) {
                    parent = parent.copyWith(isLeaf: true);
                }
                break;
            }
            var id = value;
            var icon = MenuIconConfig.getIcon(id);
            var isLeaf = (level == AppDefaults.maxMenuLevel - 1) || (row[level + 1]?.value?.toString() ?? '').isEmpty;

            if (parent == null) {
                menuMap[id] = menuMap.putIfAbsent(
                    id,
                    () => MenuItem(id: id, name: value, isLeaf: isLeaf, icon: icon),
                );
                parent = menuMap[id];
            } else {
                var child = parent.children.firstWhere(
                    (child) => child.id == id,
                    orElse: () => MenuItem(id: id, name: value, isLeaf: isLeaf, icon: icon),
                );

                if (!parent.children.contains(child)) {
                    parent.children.add(child);
                }

                parent = child;
            }
        }
    }
}
