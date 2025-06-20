import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_home_app/features/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      navigatorObservers: () {
        return [TalkerRouteObserver(GetIt.I<Talker>())];
      },
      appBarBuilder: (context, tabsRouter) {
        return AutoRouteAppBar();
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

class AutoRouteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AutoRouteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 65,
      leadingWidth: 75,
      actionsPadding: EdgeInsets.only(right: 18.0),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CircleAvatar(
          foregroundImage: const AssetImage('assets/images/momo.png'),
          backgroundColor: Color(0xFFB4B4B4),
          radius: 30,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Icon(Icons.location_on, size: 18, color: Color(0xFF00512f)),
              Text(
                'Ashgabat,',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Turkmenistan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton.outlined(
          color: Color.fromARGB(146, 247, 247, 247),
          icon: const Icon(CupertinoIcons.bell, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
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
