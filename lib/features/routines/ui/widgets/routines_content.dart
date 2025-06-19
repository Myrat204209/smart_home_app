import 'package:flutter/material.dart';
import 'package:smart_home_app/core/core.dart';
import 'package:smart_home_app/features/routines/routines.dart';

class RoutinesContent extends StatelessWidget {
  const RoutinesContent({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade300,
        leading: Icon(Icons.qr_code_rounded, size: 35, color: Colors.white),
        actions: [
          IconButtonSmall.small(icon: Icons.house, onPressed: () {}),
          IconButtonSmall.small(icon: Icons.add, onPressed: () {}),
          IconButtonSmall.small(icon: Icons.more_vert, onPressed: () {}),
        ],

        title: Text('Routines').titled(),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            RoutinesTabBar(
              routineTabController: _tabController,
              routineTabs: [
                TabExtensions.custom(icon: Icons.search),
                // Tab(icon: Icon(Icons.search, color: Colors.white)),
                TabExtensions.custom(text: 'My Routines'),
                TabExtensions.custom(text: 'Discover'),
                TabExtensions.custom(text: 'My Routines'),

                Tab(
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Expanded widget to fill the remaining space with the tab views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text('Search Automation')),
                  MyRoutinesView(),
                  DiscoverView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
