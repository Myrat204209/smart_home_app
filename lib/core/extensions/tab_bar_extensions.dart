import 'package:flutter/material.dart';

extension TabBarExtensions on TabBar {
  static TabBar custom({
    required List<Widget> tabs,
    required TabController tabController,
    Color indicatorColor = Colors.white,
    Color labelColor = Colors.white,
    Color unselectedLabelColor = Colors.grey,
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
      controller: tabController,
      tabAlignment: tabAlignment,
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      labelPadding: labelPadding,
      unselectedLabelColor: unselectedLabelColor,
    );
  }
}
