import 'package:auto_route/auto_route.dart';

import 'package:ecommerce_yildiz_flutter/product/navigator/app_router_handler.gr.dart';

class AppRoute {
  static const splash = '/splash';
  static AutoRoute splashRoute =
      AutoRoute(initial: true, path: splash, page: SplashRoute.page);
  static List<AutoRoute> routes = [
    splashRoute,
  ];
}
