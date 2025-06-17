import 'package:auto_route/auto_route.dart';

import 'app_bottom_navigation.dart';


@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   page: AppBottomNavigation.page,
    //   path: '/',
    //   initial: true,
    //   children: [
    //   ],
    // ),
  ];
}
