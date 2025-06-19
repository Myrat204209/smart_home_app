import 'package:flutter/material.dart';
import 'package:smart_home_app/features/routines/ui/ui.dart';

class RoutinesContent extends StatelessWidget {
  const RoutinesContent({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade300,
    
        leading: Icon(Icons.qr_code_rounded, size: 35, color: Colors.white),
        actions: [
          IconButtonSmall.small(
            icon: Icons.notifications,
            onPressed: () {},
          ),
          // IconButton(
          //   visualDensity: VisualDensity.compact,
          //   padding: EdgeInsets.zero,
          //   icon: const Icon(Icons.house, size: 30, color: Colors.white),
          //   onPressed: () {},
          // ),
          IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, size: 30, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
    
        title: const Text(
          'Routines',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // TabBar for different automation categories
            TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.zero,
              isScrollable: true,
    
              tabs: const [
                Tab(icon: Icon(Icons.search, color: Colors.white)),
                Tab(
                  child: Text(
                    'My Routines',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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


extension IconButtonSmall on IconButton {
  static IconButton small({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 30, color: Colors.white),
      onPressed: onPressed,
    );
  }
}