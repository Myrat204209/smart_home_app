
import 'package:flutter/material.dart';

extension TabBarExtensions on TabBar {
 static TabBar custom({
    required List<Widget> tabs,
    Color indicatorColor = Colors.white,
    Color labelColor = Colors.white,
    Color unselectedLabelColor = Colors.grey,
    bool isScrollable = true,
    TabAlignment tabAlignment = TabAlignment.start,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Color dividerColor = Colors.transparent,
    TabController? controller,
  }) {
    return TabBar(
      tabs: tabs,
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
    );
  }
}
