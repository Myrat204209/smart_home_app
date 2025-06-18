// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/dashboard/dashboard.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

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

        actionsPadding: EdgeInsets.only(right: 8, top: 12),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12),
          child: CircleAvatar(
            radius: 45,

            backgroundColor: Colors.yellow,
            child: Icon(Icons.person, color: Colors.black, size: 35),
            // Image.network(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30, color: Colors.grey),
            onPressed: () {
              // Handle notification button press
            },
          ),
          VerticalDivider(
            width: 0.5,
            indent: 5,
            endIndent: 5,
            color: Colors.grey[500],
          ),
          IconButton(
            icon: Icon(Icons.menu_rounded, size: 30, color: Colors.grey),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,

              padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,

              controller: _tabController,

              tabs: [
                DashboardTab(
                  title: 'Living Room',
                  isSelected: _tabController.index == 0,
                  icon: Icons.dashboard_outlined,
                ),
                DashboardTab(
                  title: 'Bedroom',
                  isSelected: _tabController.index == 1,
                  icon: Icons.bedroom_parent_outlined,
                ),
                DashboardTab(
                  title: 'Kitchen',
                  icon: Icons.kitchen_outlined,
                  isSelected: _tabController.index == 2,
                ),
                DashboardTab(
                  title: 'Camera',
                  icon: Icons.security,
                  isSelected: _tabController.index == 3,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListTile(
                          title: Text(
                            'Devices',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(0),
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: IconButton(
                              icon: Icon(Icons.more_horiz_rounded),
                              onPressed: () {
                                // Navigate to add device page
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 8.0,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: 4, // Example number of devices
                            itemBuilder: (context, index) {
                              return Card(
                                child: Center(
                                  child: Text('Device ${index + 1}'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                  Center(child: Text('Tab 4 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nested tab pages
@RoutePage()
class Tab1Page extends StatelessWidget {
  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tab 1 Content'));
  }
}

@RoutePage()
class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tab 2 Content'));
  }
}

@RoutePage()
class Tab3Page extends StatelessWidget {
  const Tab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tab 3 Content'));
  }
}
