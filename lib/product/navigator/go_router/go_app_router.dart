import 'package:ecommerce_yildiz_flutter/view/auth/view/login_view.dart';
import 'package:ecommerce_yildiz_flutter/view/dashboard/view/dashboard_view.dart';
import 'package:ecommerce_yildiz_flutter/view/product/price_list/view/price_list_page.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes/view/product_attributes.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes_set/view/product_attributes_view.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_pool/view/product_pool_view.dart';
import 'package:ecommerce_yildiz_flutter/view/product/stock_list/view/stock_list_view.dart';
import 'package:ecommerce_yildiz_flutter/view/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoAppRoute {
  static const splash = '/splash';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const productPool = '/productPool';
  static const priceList = '/priceList';
  static const productAttributes = '/productAttributes';
  static const productAttributesSet = '/productAttributesSet';
  static const stockList = '/stockList';
  static GoRoute redirect = GoRoute(
    path: '/',
    redirect: (_, __) => splash,
  );
  static GoRoute splashRoute = GoRoute(
    path: splash,
    name: splash,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const SplashView()),
  );
  static GoRoute loginRoute = GoRoute(
    path: login,
    name: login,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const LoginView()),
  );

  static GoRoute dashboardRoute = GoRoute(
    path: dashboard,
    name: dashboard,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const DashBoardView()),
  );
  static GoRoute productPoolRoute = GoRoute(
    path: productPool,
    name: productPool,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const ProductPoolView()),
  );
  static GoRoute priceListRoute = GoRoute(
    path: priceList,
    name: priceList,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const PriceListView()),
  );
  static GoRoute productAttributesRoute = GoRoute(
    path: productAttributes,
    name: productAttributes,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const ProductAttributesView()),
  );
  static GoRoute productAttributesSetRoute = GoRoute(
    path: productAttributesSet,
    name: productAttributesSet,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const ProductAttributesSetView()),
  );
  static GoRoute stockListRoute = GoRoute(
    path: stockList,
    name: stockList,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<void>(
            //key: _scaffoldKey,
            child: const StockListView()),
  );

  static GoRouter routes = GoRouter(initialLocation: splash, routes: [
    splashRoute,
    loginRoute,
    dashboardRoute,
    productPoolRoute,
    priceListRoute,
    productAttributesRoute,
    productAttributesSetRoute,
    stockListRoute
  ]);
}
