import 'package:flutter/material.dart';
import 'package:flutter_china_stats_visualizer/src/constants/app_defaluts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_fill_box.dart';
import '../theme/app_colors.dart';



class Header extends StatelessWidget {
    const Header({super.key, required this.drawerKey});

    final GlobalKey<ScaffoldState> drawerKey;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding, vertical: AppDefaults.padding),
            color: AppColors.bgSecondayLight,
            child: SafeArea(
                bottom: false,
                child: Row(
                    children: [
                        Expanded(
                            flex: 1,
                            child: TextFormField(
                                // style: Theme.of(context).textTheme.labelLarge,
                                decoration: InputDecoration(
                                    hintText: "Search...",
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: AppDefaults.padding,
                                            right: AppDefaults.padding / 2),
                                        child: SvgPicture.asset("assets/icons/search_light.svg"),
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                                    border: AppDefaults.outlineInputBorder,
                                    focusedBorder: AppDefaults.focusedOutlineInputBorder,
                                ),
                            ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Badge(
                                            isLabelVisible: true,
                                            child:
                                            SvgPicture.asset("assets/icons/message_light.svg"),
                                        ),
                                    ),
                                    AppFillBox.gapW16,
                                    IconButton(
                                        onPressed: () {},
                                        icon: Badge(
                                            isLabelVisible: true,
                                            child: SvgPicture.asset(
                                                "assets/icons/notification_light.svg"),
                                        ),
                                    ),
                                    AppFillBox.gapW16,
                                    IconButton(
                                        onPressed: () {},
                                        icon: const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression"),
                                        ),
                                    ),
                                    TextButton(
                                        onPressed: () => context.go('/sign-in'),
                                        style: TextButton.styleFrom(
                                            foregroundColor:
                                            Theme.of(context).textTheme.titleLarge!.color,
                                            minimumSize: const Size(80, 56),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(AppDefaults.borderRadius),
                                                ),
                                            ),
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                        child: const Text("Sign In"),
                                    ),
                                    AppFillBox.gapW16,
                                    ElevatedButton(
                                        onPressed: () => context.go('/register'),
                                        child: const Text("Sign Up"),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}