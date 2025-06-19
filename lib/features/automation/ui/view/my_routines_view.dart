import 'package:flutter/material.dart';
import 'package:smart_home_app/features/automation/ui/ui.dart';

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
          indicatorColor: Colors.green.withAlpha(200),
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: true,
          tabs: const [
            AutomationTab(
              title: 'All',
              icon: Icons.all_inclusive,
              isSelected: false,
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
