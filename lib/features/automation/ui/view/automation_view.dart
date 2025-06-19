import 'package:flutter/material.dart';
import 'package:smart_home_app/features/automation/ui/ui.dart';

class AutomationView extends StatefulWidget {
  const AutomationView({super.key});

  @override
  State<AutomationView> createState() => _AutomationViewState();
}

class _AutomationViewState extends State<AutomationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {}
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade400,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade400,
        toolbarHeight: 60,
        leadingWidth: 80,
        actionsPadding: const EdgeInsets.only(right: 8, top: 12),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12),
          child: Icon(Icons.home, size: 35, color: Colors.yellow),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30, color: Colors.grey),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
        title: const Text('Automation', style: TextStyle(fontSize: 24)),
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
