
import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/constants/app_defaluts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_fill_box.dart';
import '../../features/main_frame/domain/menu_item_domain.dart';
import '../../theme/app_colors.dart';
import 'menu_tile.dart';

/// 左侧菜单
class Sidebar extends ConsumerWidget  {
    const Sidebar({super.key});

    /// 构建菜单
    List<Widget> _buildMenuItems(List<MenuItem> items,BuildContext context){
        return items.map((item){
                if(item.isLeaf && item.children.isNotEmpty ){
                    return MenuTile(
                        isActive: true,
                        title: item.name,
                        activeIconSrc: item.activeIcon,
                        inactiveIconSrc: item.inactiveIcon,
                        onPressed: () {},
                    );
                }else{
                    return ExpansionTile(
                        leading: SvgPicture.asset(item.icon),
                        title: Text(
                            item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                        ),
                        children: _buildMenuItems(item.children, context),
                    );
                }
            }).toList();
    }

    @override
    Widget build(BuildContext context,WidgetRef ref) {
        return Drawer(
            // width: Responsive.isMobile(context) ? double.infinity : null,
            // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
            backgroundColor: Colors.transparent,

            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDefaults.padding,
                                        vertical: AppDefaults.padding * 1.5,
                                    ),
                                    child: SvgPicture.asset(AppDefaults.logo),
                                ),
                            ],
                        ),
                        const Divider(),
                        AppFillBox.gapH16,
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDefaults.padding,
                                ),
                                child: ListView(
                                    children: [
                                        MenuTile(
                                            isActive: true,
                                            title: "Home",
                                            activeIconSrc: "assets/icons/home_filled.svg",
                                            inactiveIconSrc: "assets/icons/home_light.svg",
                                            onPressed: () {},
                                        ),
                                        ExpansionTile(
                                            leading:
                                            SvgPicture.asset("assets/icons/diamond_light.svg"),
                                            title: Text(
                                                "Products",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context).textTheme.bodyMedium!.color,
                                                ),
                                            ),
                                            children: [
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Dashboard",
                                                    onPressed: () {},
                                                ),
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Products",
                                                    count: 16,
                                                    onPressed: () {},
                                                ),
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Add Product",
                                                    onPressed: () {},
                                                ),
                                            ],
                                        ),

                                        // Customers
                                        ExpansionTile(
                                            leading: SvgPicture.asset(
                                                "assets/icons/profile_circled_light.svg"),
                                            title: Text(
                                                "Customers",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context).textTheme.bodyMedium!.color,
                                                ),
                                            ),
                                            children: [
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Dashboard",
                                                    onPressed: () {},
                                                ),
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Products",
                                                    count: 16,
                                                    onPressed: () {},
                                                ),
                                                MenuTile(
                                                    isSubmenu: true,
                                                    title: "Add Product",
                                                    onPressed: () {},
                                                ),
                                            ],
                                        ),
                                        MenuTile(
                                            title: "Shop",
                                            activeIconSrc: "assets/icons/store_light.svg",
                                            inactiveIconSrc: "assets/icons/store_filled.svg",
                                            onPressed: () {},
                                        ),
                                    ],
                                ),
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Column(
                                children: [

                                    AppFillBox.gapH8,
                                    const Divider(),
                                    AppFillBox.gapH8,
                                    Row(
                                        children: [
                                            SvgPicture.asset(
                                                'assets/icons/help_light.svg',
                                                height: 24,
                                                width: 24,
                                                colorFilter: const ColorFilter.mode(
                                                    AppColors.textLight,
                                                    BlendMode.srcIn,
                                                ),
                                            ),
                                            AppFillBox.gapW8,
                                            Text(
                                                'Help & getting started',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium
                                                    ?.copyWith(fontWeight: FontWeight.w600),
                                            ),
                                            const Spacer(),
                                            Chip(
                                                backgroundColor: AppColors.secondaryLavender,
                                                side: BorderSide.none,
                                                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                                                label: Text(
                                                    "8",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .copyWith(fontWeight: FontWeight.w700),
                                                ),
                                            ),
                                        ],
                                    ),
                                    AppFillBox.gapH20,
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
