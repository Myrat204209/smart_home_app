import 'package:flutter/material.dart';
import 'package:smart_home_app/core/extensions/tab_bar_extensions.dart';

class RoutinesTabBar extends StatelessWidget {
  const RoutinesTabBar({
    super.key,
    required TabController routineTabController,
    required List<Widget> routineTabs,
  }) : _routinetabController = routineTabController,
       _routineTabs = routineTabs;

  final TabController _routinetabController;
  final List<Widget> _routineTabs;

  @override
  Widget build(BuildContext context) {
    return TabBarExtensions.custom(
      tabs: _routineTabs,
      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.black,
      dividerColor: Colors.transparent,
      tabController: _routinetabController,
    );
  }
}
