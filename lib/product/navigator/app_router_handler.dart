import 'package:auto_route/auto_route.dart';

import 'app_router.dart';
import 'app_router_handler.gr.dart';

export 'app_router.dart';
export 'app_router_handler.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouterHandler extends $AppRouterHandler {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        ...AppRoute.routes,
        RedirectRoute(
          path: '*',
          redirectTo: AppRoute.splash,
        ),
      ];
}
