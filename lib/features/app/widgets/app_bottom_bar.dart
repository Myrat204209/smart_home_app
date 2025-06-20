// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_bottom_bar_icon.dart';
class AppBottomBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  const AppBottomBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: tabsRouter.activeIndex,
      onDestinationSelected: (index) {
        if (tabsRouter.activeIndex != index) {
          tabsRouter.setActiveIndex(index);
        } else {
          tabsRouter
              .innerRouterOf<StackRouter>(tabsRouter.current.name)
              ?.popUntilRoot();
        }
      },
      destinations: [
        AppBottomBarIcon(
          tabsRouterIndex: tabsRouter.activeIndex,
          destinationIndex: 0,
          icon: Icons.home_outlined,
          label: 'Home',
        ),
        AppBottomBarIcon(
          tabsRouterIndex: tabsRouter.activeIndex,
          destinationIndex: 1,
          icon: Icons.auto_awesome_outlined,
          label: 'Routines',
        ),
        AppBottomBarIcon(
          tabsRouterIndex: tabsRouter.activeIndex,
          destinationIndex: 2,
          icon: Icons.person_outline,
          label: 'Profile',
        ),
      ],
      height: 89,
      indicatorShape: null,

      backgroundColor: Colors.white,
    );
  }
}

