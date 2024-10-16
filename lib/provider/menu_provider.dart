import 'package:flutter_china_stats_visualizer/constants/app_defaluts.dart';
import 'package:flutter_china_stats_visualizer/constants/menu_config.dart';
import 'package:flutter_china_stats_visualizer/entity/menu_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:excel/excel.dart';
import 'dart:typed_data';

class MenuNotifier extends Notifier<List<MenuItem>> {

    @override
    List<MenuItem> build() {
        return [];
    }

    Future<void> loadExcelData(Uint8List bytes) async {
        var excel = Excel.decodeBytes(bytes);
        var sheet = excel.tables[excel.tables.keys.first];

        if (sheet == null) return;

        Map<String, MenuItem> menuMap = {};

        for (var row in sheet.rows.skip(1)) { // 跳过标题行
            _addMenuItem(menuMap, row);
        }

        state = menuMap.values.toList();
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
            var icon = MenuConfig.getIcon(id);
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

final  menuProvider = NotifierProvider<MenuNotifier, List<MenuItem>>((ref) {
  return MenuNotifier();
});


