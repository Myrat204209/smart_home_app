import 'package:flutter/material.dart';
import 'package:smart_home_app/features/routines/routines.dart';

class InnerRoutinesTabBar extends StatelessWidget {
  const InnerRoutinesTabBar({super.key, required TabController tabController})
    : _innerRoutineTabController = tabController;

  final TabController _innerRoutineTabController;

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
      tabs: [
        for (int i = 0; i < 3; i++)
          InnerRoutinesTab(
            title: kRoutineTabTitles[i],
            isSelected: i == _innerRoutineTabController.index,
          ),
        InnerRoutinesTab(icon: Icons.add),
      ],
    );
  }
}
