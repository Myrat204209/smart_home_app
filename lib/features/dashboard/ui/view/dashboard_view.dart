// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/features/dashboard/ui/widgets/dashboard_tab.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 4, vsync: this);
    // Initialize PageController
    _pageController = PageController();

    // Sync TabBar with PageView
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });

    // Sync PageView with TabBar
    _pageController.addListener(() {
      if (_pageController.page != null) {
        final pageIndex = _pageController.page!.round();
        if (_tabController.index != pageIndex) {
          _tabController.animateTo(pageIndex);
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
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
isSelected:                 _tabController.index == 1,
                icon: Icons.bedroom_parent_outlined,
              ),
              DashboardTab(title: 'Kitchen', icon: Icons.kitchen_outlined,isSelected: _tabController.index == 2,),
              DashboardTab(title: 'Camera', icon: Icons.security,isSelected: _tabController.index == 3,),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Center(child: Text('Tab 1 Content')),
                Center(child: Text('Tab 2 Content')),
                Center(child: Text('Tab 3 Content')),
                Center(child: Text('Tab 4 Content')),
              ],
              //  child: const AutoRouter()),
            ),
          ),
        ],
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
