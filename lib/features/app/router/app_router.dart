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
        AutoRoute(
          page: DashboardRoute.page,
          path: 'dashboard',
          initial: true,
          children: [
            AutoRoute(
              path: 'tab1',
              page: Tab1Route.page,
              initial: true,
              children: [
                // AutoRoute(path: 'thermostat', page: ThermostatRoute.page),
              ],
            ),
            AutoRoute(path: 'tab2', page: Tab2Route.page),
            AutoRoute(path: 'tab3', page: Tab3Route.page),
          ],
        ),
        AutoRoute(page: RoutinesRoute.page, path: 'routines'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),
  ];
}
