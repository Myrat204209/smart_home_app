import 'package:flutter/material.dart';

class InnerRoutinesTabBar extends StatelessWidget {
  const InnerRoutinesTabBar({
    super.key,
    required TabController tabController,
    required List<Widget> innerRoutineTabs,
  }) : _innerRoutineTabController = tabController,
       _innerRoutineTabs = innerRoutineTabs;

  final TabController _innerRoutineTabController;
  final List<Widget> _innerRoutineTabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _innerRoutineTabController,
      labelPadding: EdgeInsets.symmetric(horizontal: 4),
      dividerColor: Colors.transparent,
      padding: EdgeInsets.zero,

      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.transparent,
      indicatorPadding: EdgeInsets.zero,
      isScrollable: true,
      tabs: _innerRoutineTabs,
    );
  }
}
