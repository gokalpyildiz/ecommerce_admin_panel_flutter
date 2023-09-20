import 'package:get/get.dart';

import '../../../view/auth/view/login_view.dart';
import '../../../view/dashboard/view/dashboard_view.dart';
import '../../../view/product/add_product/view/add_product_view.dart';
import '../../../view/product/price_list/view/price_list_page.dart';
import '../../../view/product/product_attributes/view/product_attributes_view.dart';
import '../../../view/product/product_pool/view/product_pool_view.dart';
import '../../../view/product/stock_list/view/stock_list_view.dart';
import '../../../view/splash/view/splash_view.dart';
import 'aut_middleware.dart';

class AppPages {
  AppPages._();

  //static const initial = Routes.splash;
  static const splash = '/splash';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const productPool = '/products/productPool';
  static const priceList = '/products/priceList';
  static const productAttributes = '/products/productAttributes';
  static const productAttributesSet = '/products/productAttributesSet';
  static const stockList = '/stockList';
  static const addProduct = '/products/addProduct';

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: '/',
      page: () => const DashBoardView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()]
    ),

    GetPage(name: splash, page: () => const SplashView()),

    GetPage(
      name: login,
      page: () => const LoginView(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: productPool,
      page: () => const ProductPoolView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: dashboard,
      page: () => const DashBoardView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),

    ///--------------- Ecommerce ---------------///
    GetPage(
      name: priceList,
      page: () => const PriceListView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: productAttributes,
      page: () => const ProductAttributesView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: productAttributesSet,
      page: () => const ProductAttributesView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: stockList,
      page: () => const StockListView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: addProduct,
      page: () => const AddProductView(),
      transition: Transition.noTransition,
      //middlewares: [AuthMiddleware()],
    ),

    ///---------------- File ----------------///
  ];
  // var a = routes
  //     .map((e) => GetPage(
  //           name: e.name,
  //           page: e.page,
  //           middlewares: e.middlewares,
  //           transition: Transition.noTransition,
  //         ))
  //     .toList();
  // return a;
}
