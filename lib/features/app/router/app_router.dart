import 'package:auto_route/auto_route.dart';
import 'package:smart_home_app/features/features.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AppBottomNavigation.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: DashboardRoute.page, path: 'dashboard', initial: true),

        AutoRoute(page: RoutinesRoute.page, path: 'routines'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),
    AutoRoute(path: '/lights', page: LightsRoute.page),
  ];
}
