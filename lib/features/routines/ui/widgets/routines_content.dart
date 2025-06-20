import 'package:flutter/material.dart';
import 'package:smart_home_app/core/core.dart';
import 'package:smart_home_app/features/routines/routines.dart';

class RoutinesContent extends StatelessWidget {
  const RoutinesContent({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoutinesTabBar(
            routineTabController: _tabController,
            routineTabs: [
              TabExtensions.custom(
                text: 'My Routines',
                selected: _tabController.index == 0,
              ),
              TabExtensions.custom(
                text: 'Discover',
                selected: _tabController.index == 1,
              ),
            ],
          ),
          SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [MyRoutinesView(), DiscoverView()],
            ),
          ),
        ],
      ),
    );
  }
}
