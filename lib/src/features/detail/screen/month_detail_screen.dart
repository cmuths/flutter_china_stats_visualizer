import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/constants/app_fill_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../dummy_data/development.dart';
import '../../../utils/utils.dart';

class MonthDetailScreen extends ConsumerStatefulWidget {
  const MonthDetailScreen({super.key});

  @override
  ConsumerState createState() => _MonthDetailScreenState();
}

class _MonthDetailScreenState extends ConsumerState<MonthDetailScreen> {
  final GlobalKey<SliverTreeViewState> _simpleTreeKey =
      GlobalKey<SliverTreeViewState>();

  late final TextEditingController searchBarTextEditingController;

  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();
    searchBarTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final dummyData = DummyData(10, 100);
    columns.addAll(dummyData.columns);
    rows.addAll(dummyData.rows);
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ],
          ),
        ),
        AppFillBox.gapH16,
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SearchBar(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        controller: searchBarTextEditingController,
                        hintText: 'Type to Filter',
                        leading: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.filter_list),
                        ),
                        trailing: [
                          Badge(
                            isLabelVisible: true,
                            label: Text(
                              '10/100',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () =>
                                searchBarTextEditingController.clear(),
                          )
                        ],
                      ),
                    ),
                    TreeView.simpleTyped<UserName, TreeNode<UserName>>(
                      tree: tree,
                      expansionBehavior:
                          ExpansionBehavior.collapseOthersAndSnapToTop,
                      shrinkWrap: true,
                      builder: (context, node) => Card(
                        color: colorMapper[
                            node.level.clamp(0, colorMapper.length - 1)]!,
                        child: ListTile(
                          title: Text("Item ${node.level}-${node.key}"),
                          subtitle: Text(
                              '${node.data?.firstName} ${node.data?.lastName}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppFillBox.gapW16,
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 子组件
                          Text(
                            "指标明细：",
                            style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              "刷新指标",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppFillBox.gapH8,
                    Expanded(
                      flex: 12,
                      child: PlutoGrid(
                        columns: columns,
                        rows: rows,
                        onChanged: (PlutoGridOnChangedEvent event) {
                          print(event);
                        },
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          event.stateManager
                              .setSelectingMode(PlutoGridSelectingMode.cell);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserName {
  final String firstName;
  final String lastName;

  UserName(this.firstName, this.lastName);
}

final tree = TreeNode<UserName>.root(data: UserName("User", "Names"))
  ..addAll([
    TreeNode<UserName>(key: "0A", data: UserName("Sr. John", "Doe"))
      ..add(TreeNode(key: "0A1A", data: UserName("Jr. John", "Doe"))),
    TreeNode<UserName>(key: "0C", data: UserName("General", "Lee"))
      ..addAll([
        TreeNode<UserName>(key: "0C1A", data: UserName("Major", "Lee")),
        TreeNode<UserName>(key: "0C1B", data: UserName("Happy", "Lee")),
        TreeNode<UserName>(key: "0C1C", data: UserName("Busy", "Lee"))
          ..addAll([
            TreeNode<UserName>(
                key: "0C1C2A", data: UserName("Jr. Busy", "Lee")),
            TreeNode<UserName>(
                key: "0C1C2A1", data: UserName("Jr. Busy", "Lee")),
            TreeNode<UserName>(
                key: "0C1C2A2", data: UserName("Jr. Busy", "Lee"))
          ]),
      ]),
    TreeNode<UserName>(key: "0D", data: UserName("Mr. Anderson", "Neo")),
    TreeNode<UserName>(key: "0E", data: UserName("Mr. Smith", "Agent")),
  ]);
