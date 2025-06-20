// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart' show CupertinoIcons;
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
    _tabController = TabController(length: 6, vsync: this);

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
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          TabBarExtensions.custom(
            tabController: _tabController,
            tabs: [
              DashboardTab(
                title: 'Bedroom',
                isSelected: _tabController.index == 0,
                icon: CupertinoIcons.bed_double,
              ),
              DashboardTab(
                title: 'Living Room',
                isSelected: _tabController.index == 1,
                icon: Icons.chair_outlined,
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
              DashboardTab(
                title: 'Kids Room',
                icon: Icons.child_care_outlined,
                isSelected: _tabController.index == 4,
              ),
              DashboardTab(
                title: 'Front Door',
                icon: Icons.door_front_door_outlined,
                isSelected: _tabController.index == 5,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                  DashboardDevicesGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
