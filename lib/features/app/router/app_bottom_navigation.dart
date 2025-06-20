import 'package:auto_route/auto_route.dart';
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
        return AppTopBar(bottomIndex: tabsRouter.activeIndex,);
      },
      backgroundColor: Color(0xfffbfbfd),
      homeIndex: 0,
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      routes: [DashboardRoute(), RoutinesRoute(), ProfileRoute()],

      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomBar(tabsRouter: tabsRouter);
      },
    );
  }
}
