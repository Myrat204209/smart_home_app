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
      appBar: AppBar(
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
              padding: EdgeInsets.all(0),
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.all(0),
              isScrollable: true,

              tabs: const [
                Tab(icon: Icon(Icons.search)),
                Tab(text: 'My Routines'),
                Tab(text: 'Discover'),
              ],
            ),
            // Expanded widget to fill the remaining space with the tab views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MyRoutinesView(),
                  Center(child: Text('Security Settings')),
                  Center(child: Text('Scenes Management')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRoutinesView extends StatefulWidget {
  const MyRoutinesView({super.key});

  @override
  State<MyRoutinesView> createState() => _MyRoutinesViewState();
}

class _MyRoutinesViewState extends State<MyRoutinesView>
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
    return Column(
      children: [
        // TabBar for different routine categories
        TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          tabAlignment: TabAlignment.start,
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: true,
          tabs: const [
            AutomationTab(
              title: 'All',
              icon: Icons.all_inclusive,
              isSelected: true,
            ),
            AutomationTab(
              title: 'Favorites',
              icon: Icons.favorite,
              isSelected: false,
            ),
            AutomationTab(
              title: 'Scheduled',
              icon: Icons.schedule,
              isSelected: false,
            ),
          ],
        ),
        // Expanded widget to fill the remaining space with the tab views
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('All Routines')),
              Center(child: Text('Favorite Routines')),
              Center(child: Text('Scheduled Routines')),
            ],
          ),
        ),
      ],
    );
  }
}
