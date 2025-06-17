import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,

      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      routes: [],

      // backgroundColor: AppColors.bgMain,
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          indicatorColor: Colors.transparent,
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
          destinations: [],
          height: 56,
          indicatorShape: null,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}

// Your NavigationDestinationIcon class remains the same
class NavigationDestinationIcon extends StatelessWidget {
  const NavigationDestinationIcon({
    super.key,
    required this.tabsRouterIndex,
    required this.destinationIndex,
    required this.icon,
    required this.label,
  });

  final int tabsRouterIndex;
  final int destinationIndex;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        // color: tabsRouterIndex == destinationIndex
        //     ? AppColors.mainAccent
        //     : AppColors.iconColor,
      ),
      label: label,
    );
  }
}
