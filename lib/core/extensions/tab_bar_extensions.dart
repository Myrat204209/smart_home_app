import 'package:flutter/material.dart';

extension TabBarExtensions on TabBar {
  static TabBar custom({
    required List<Widget> tabs,
    required TabController tabController,
    Color indicatorColor = Colors.grey,
    Color labelColor = Colors.white,
    Color unselectedLabelColor = Colors.white,
    bool isScrollable = true,

    TabAlignment tabAlignment = TabAlignment.start,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    Color dividerColor = Colors.transparent,
  }) {
    return TabBar(
      tabs: tabs,
      padding: padding,
      isScrollable: isScrollable,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
      indicatorWeight: 0.3,
      controller: tabController,
      tabAlignment: tabAlignment,
      indicatorColor: indicatorColor.withAlpha(50),
      labelColor: labelColor,
      labelPadding: labelPadding,
      unselectedLabelColor: unselectedLabelColor,
    );
  }
}
