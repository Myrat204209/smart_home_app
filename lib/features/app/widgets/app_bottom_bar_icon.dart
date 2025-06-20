part of 'app_bottom_bar.dart';

class AppBottomBarIcon extends StatelessWidget {
  const AppBottomBarIcon({
    super.key,
    required this.tabsRouterIndex,
    required this.destinationIndex,
    required this.icon,
    required this.label,
  });

  final int tabsRouterIndex;
  final int destinationIndex;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        // color: tabsRouterIndex == destinationIndex
        //     ? AppColors.mainAccent
        //     : AppColors.iconColor,
        color: Color(0xFF969696),
      ),
      label: label,
    );
  }
}
