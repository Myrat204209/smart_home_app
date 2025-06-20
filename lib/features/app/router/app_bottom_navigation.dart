import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/app/app.dart';

@RoutePage()
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          leading: CircleAvatar(
            foregroundImage: const AssetImage('assets/images/momo.jpg'),
            backgroundColor: Color(0xFFB4B4B4),
            radius: 25,
          ),
          title: Text('John Doe'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Icon(Icons.location_on_outlined, size: 16),
                Text(
                  'Ashgabat,',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Turkmenistan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        );
      },
      homeIndex: 0,
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      routes: [DashboardRoute(), RoutinesRoute(), ProfileRoute()],

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
          destinations: [
            NavigationDestinationIcon(
              tabsRouterIndex: tabsRouter.activeIndex,
              destinationIndex: 0,
              icon: Icons.home,
              label: 'Home',
            ),
            NavigationDestinationIcon(
              tabsRouterIndex: tabsRouter.activeIndex,
              destinationIndex: 1,
              icon: Icons.auto_awesome,
              label: 'Routines',
            ),
            NavigationDestinationIcon(
              tabsRouterIndex: tabsRouter.activeIndex,
              destinationIndex: 1,
              icon: Icons.person,
              label: 'Profile',
            ),
          ],
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
