// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/core/core.dart';
import 'package:smart_home_app/features/features.dart';

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
        toolbarHeight: 50,
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
          IconButtonSmall.small(
            icon: Icons.search,
            color: Colors.grey,
            onPressed: () {},
          ),
          VerticalDivider(
            width: 0.5,
            indent: 5,
            endIndent: 5,
            color: Colors.grey[500],
          ),
          IconButtonSmall.small(
            icon: Icons.menu_rounded,
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            TabBarExtensions.custom(
              tabController: _tabController,
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
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),

                ],
              ),
            ),
            Expanded(child: AutoRouter())
          ],
        ),
      ),
    );
  }
}

// @RoutePage()
class Tab1Page extends StatelessWidget {
  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardDevicesGrid();
    // return const Center(child: Text('Tab 2 Content'));
  }
}

// @RoutePage()
class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardDevicesGrid();
    // return const Center(child: Text('Tab 2 Content'));
  }
}

// @RoutePage()
class Tab3Page extends StatelessWidget {
  const Tab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardDevicesGrid();
    // return const Center(child: Text('Tab 3 Content'));
  }
}

// @RoutePage()
class Tab4Page extends StatelessWidget {
  const Tab4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardDevicesGrid();
    // return const Center(child: Text('Tab 4 Content'));
  }
}
