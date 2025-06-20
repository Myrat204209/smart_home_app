// import 'package:flutter/cupertino.dart' show CupertinoIcons;
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:smart_home_app/core/core.dart';
// import 'package:smart_home_app/features/dashboard/dashboard.dart';

// class DashboardHookView extends HookWidget {
//   const DashboardHookView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final tabController = useTabController(initialLength: 6);
//     tabController.addListener(() {
//       if (tabController.indexIsChanging) {
//         // You can add any additional logic here if needed when the tab changes
//         // For example, you might want to log the current index or perform some action
//         print('Current tab index: ${tabController.index}');
//         tabController.animateTo(tabController.index);
//       }
//     });
//     return Padding(
//       padding: const EdgeInsets.only(top: 25),
//       child: Column(
//         children: [
//           TabBarExtensions.custom(
//             tabController: tabController,
//             tabs: [
//               DashboardTab(
//                 title: 'Bedroom',
//                 isSelected: tabController.index == 0,
//                 icon: CupertinoIcons.bed_double,
//               ),
//               DashboardTab(
//                 title: 'Living Room',
//                 isSelected: tabController.index == 1,
//                 icon: Icons.chair_outlined,
//               ),
//               DashboardTab(
//                 title: 'Kitchen',
//                 icon: Icons.kitchen_outlined,
//                 isSelected: tabController.index == 2,
//               ),
//               DashboardTab(
//                 title: 'Camera',
//                 icon: Icons.security,
//                 isSelected: tabController.index == 3,
//               ),
//               DashboardTab(
//                 title: 'Kids Room',
//                 icon: Icons.child_care_outlined,
//                 isSelected: tabController.index == 4,
//               ),
//               DashboardTab(
//                 title: 'Front Door',
//                 icon: Icons.door_front_door_outlined,
//                 isSelected: tabController.index == 5,
//               ),
//             ],
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: TabBarView(
//                 controller: tabController,

//                 children: [
//                   DashboardDevicesGrid(),
//                   DashboardDevicesGrid(),
//                   DashboardDevicesGrid(),
//                   DashboardDevicesGrid(),
//                   DashboardDevicesGrid(),
//                   DashboardDevicesGrid(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
