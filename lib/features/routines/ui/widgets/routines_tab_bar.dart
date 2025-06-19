import 'package:flutter/material.dart';

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
    return TabBar(
      controller: _routinetabController,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      indicatorPadding: EdgeInsets.zero,
      isScrollable: true,

      tabs: _routineTabs,
    );
  }
}
