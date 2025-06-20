// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    _tabController = TabController(
      length: kDashboardTabIcons.length,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
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
              for (var i = 0; i < kDashboardTabTitles.length; i++)
                DashboardTab(
                  title: kDashboardTabTitles[i],
                  icon: kDashboardTabIcons[i],
                  isSelected: _tabController.index == i,
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  DashboardAllDeviceExpansibles(),
                  for (var i = 1; i < 7; i++)
                    DashboardDevicesGrid(
                      roomIndex: i,
                      roomName: kDashboardTabTitles[i],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
