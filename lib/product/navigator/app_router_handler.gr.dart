// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:ecommerce_yildiz_flutter/view/auth/view/login_view.dart' as _i2;
import 'package:ecommerce_yildiz_flutter/view/dashboard/view/dashboard_view.dart'
    as _i1;
import 'package:ecommerce_yildiz_flutter/view/product/price_list/view/price_list_page.dart'
    as _i3;
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes/view/product_attributes.dart'
    as _i5;
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes_set/view/product_attributes_view.dart'
    as _i4;
import 'package:ecommerce_yildiz_flutter/view/product/product_pool/view/product_pool_view.dart'
    as _i6;
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/view/stock_list_view.dart'
    as _i8;
import 'package:ecommerce_yildiz_flutter/view/splash/view/splash_view.dart'
    as _i7;

abstract class $AppRouterHandler extends _i9.RootStackRouter {
  $AppRouterHandler({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i1.DashBoardView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i2.LoginView(),
      );
    },
    PriceListRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i3.PriceListView(),
      );
    },
    ProductAttributesSetRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i4.ProductAttributesSetView(),
      );
    },
    ProductAttributesRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i5.ProductAttributesView(),
      );
    },
    ProductPoolRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i6.ProductPoolView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i7.SplashView(),
      );
    },
    StockListRoute.name: (routeData) {
      return _i9.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i8.StockListView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashBoardView]
class DashBoardRoute extends _i9.PageRouteInfo<void> {
  const DashBoardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PriceListView]
class PriceListRoute extends _i9.PageRouteInfo<void> {
  const PriceListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PriceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PriceListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductAttributesSetView]
class ProductAttributesSetRoute extends _i9.PageRouteInfo<void> {
  const ProductAttributesSetRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductAttributesSetRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductAttributesSetRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductAttributesView]
class ProductAttributesRoute extends _i9.PageRouteInfo<void> {
  const ProductAttributesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductAttributesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductAttributesRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProductPoolView]
class ProductPoolRoute extends _i9.PageRouteInfo<void> {
  const ProductPoolRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductPoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductPoolRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashView]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.StockListView]
class StockListRoute extends _i9.PageRouteInfo<void> {
  const StockListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          StockListRoute.name,
          initialChildren: children,
        );

  static const String name = 'StockListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
