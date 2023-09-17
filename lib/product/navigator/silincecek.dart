import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../view/auth/view/login_view.dart';
import '../../view/dashboard/view/dashboard_view.dart';
import '../../view/product/price_list/view/price_list_page.dart';
import '../../view/product/product_attributes/view/product_attributes.dart';
import '../../view/product/product_pool/view/product_pool_view.dart';
import '../../view/product/stock_list/view/stock_list_view.dart';
import '../../view/splash/view/splash_view.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return RouteSettings(name: '/login');
  }
}

List<GetPage<dynamic>> getPageRoute() {
  return [
    GetPage(
        name: '/',
        page: () => const DashBoardView(),
        middlewares: [AuthMiddleware()]),

    GetPage(name: '/splash', page: () => const SplashView()),

    GetPage(
        name: '/login',
        page: () => const LoginView(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/productPool',
        page: () => const ProductPoolView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => const DashBoardView(),
        middlewares: [AuthMiddleware()]),

    ///--------------- Ecommerce ---------------///
    GetPage(
        name: '/priceList',
        page: () => const PriceListView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/productAttributes',
        page: () => const ProductAttributesView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/productAttributesSet',
        page: () => const ProductAttributesView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/stockList',
        page: () => const StockListView(),
        middlewares: [AuthMiddleware()]),

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

// class AuthMiddleware1 extends MyMiddleware {
//   @override
//   String handle(String routeName) {
//     return AuthService.isLoggedIn ? routeName : '/auth/login';
//   }
// }
//
// PageRouteBuilder generateRoute(BuildContext context, RouteSettings settings) {
//   MyRoutes.registerRoute(
//       MyRoute(name: '/pricing', builder: (_) => const Pricing()));
//   MyRoutes.registerRoute(
//       MyRoute(name: '/faqs', builder: (_) => const FaqsPage()));
//   MyRoutes.registerRoute(
//       MyRoute(name: '/starter', builder: (_) => const Starter()));
//
//   var routes = [
//     MyRoute(
//         name: '/dashboard',
//         builder: (_) => const DashboardPage(),
//         middlewares: [AuthMiddleware1()]),
//     // Ecommerce
//     MyRoute(
//         name: '/apps/ecommerce/products',
//         builder: (_) => const ProductPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/apps/ecommerce/add_product',
//         builder: (_) => const AddProduct(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/apps/ecommerce/product-detail',
//         builder: (_) => const ProductDetail(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/apps/ecommerce/customers',
//         builder: (_) => const Customers(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/apps/ecommerce/invoice',
//         builder: (_) => const InvoicePage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------File----------------//
//     MyRoute(
//         name: '/apps/files',
//         builder: (_) => const FileManager(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/apps/file-uploader',
//         builder: (_) => const FileUploader(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------NFT----------------//
//     MyRoute(
//         name: '/nft/dashboard',
//         builder: (_) => const NftDashboard(),
//         middlewares: [AuthMiddleware1()]),
//
//     //-----------------Jobs-----------------//
//     MyRoute(
//         name: '/job/job-vacancee',
//         builder: (_) => const JobVacanceePage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/job/job-candidate',
//         builder: (_) => const JobCandiadatePage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //-----------------Profile-----------------//
//     MyRoute(
//         name: '/profile',
//         builder: (_) => const ProfilePage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------Auth----------------//
//     MyRoute(
//         name: '/auth/login',
//         builder: (_) => const LoginPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/auth/forgot-password',
//         builder: (_) => const ForgotPassword(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/auth/register',
//         builder: (_) => const Register(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/auth/reset_password',
//         builder: (_) => const ResetPassword(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/auth/locked',
//         builder: (_) => const LockedPage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------UI----------------//
//     MyRoute(
//         name: '/ui/buttons',
//         builder: (_) => const ButtonsPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/cards',
//         builder: (_) => const CardsPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/tabs',
//         builder: (_) => const TabsPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/dialogs',
//         builder: (_) => const Dialogs(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/carousels',
//         builder: (_) => const Carousels(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/drag-drop',
//         builder: (_) => const DragDropPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/notifications',
//         builder: (_) => const Notifications(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/reviews',
//         builder: (_) => const ReviewsPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/discover',
//         builder: (_) => const DiscoverJobs(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/ui/landing',
//         builder: (_) => const LandingPage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------ExtraPages----------------//
//     MyRoute(
//         name: '/coming-soon',
//         builder: (_) => const ComingSoonPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/error-404',
//         builder: (_) => const Error404(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/error-500',
//         builder: (_) => const Error500(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/maintenance',
//         builder: (_) => const MaintenancePage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------Chat----------------//
//
//     MyRoute(
//         name: '/chat',
//         builder: (_) => const ChatPage(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------Form----------------//
//     MyRoute(
//         name: '/form/basic',
//         builder: (_) => const BasicPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/form/validation',
//         builder: (_) => const ValidationPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/form/quill-editor',
//         builder: (_) => const QuillEditor(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/form/form-mask',
//         builder: (_) => const FormMaskPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/form/wizard',
//         builder: (_) => const Wizard(),
//         middlewares: [AuthMiddleware1()]),
//
//     ///----------------Other----------------//
//
//     MyRoute(
//         name: '/other/basic_tables',
//         builder: (_) => const BasicTable(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/other/syncfusion_charts',
//         builder: (_) => const SyncFusionChart(),
//         middlewares: [AuthMiddleware1()]),
//
//     //----------------Maps----------------//
//     MyRoute(
//         name: '/maps/sf-maps',
//         builder: (_) => const SfMapPage(),
//         middlewares: [AuthMiddleware1()]),
//     MyRoute(
//         name: '/maps/google-maps',
//         builder: (_) => const GoogleMapPage(),
//         middlewares: [AuthMiddleware1()]),
//
//     MyRoute(
//         name: '/',
//         builder: (_) => const DashboardPage(),
//         middlewares: [AuthMiddleware1()]),
//   ];
//
//   //Dashboard
//   // MyRoutes.registerRoute();
//   //
//   // MyRoutes.registerRoute();
//
//   ///========== UI =================///
//
//   // UI Pages
//
//   // MyRoutes.registerRoute();
//
//   MyRoutes.registerRoutes(routes);
//
//   //Finding Routes
//   MyRoute? route = MyRouter.getSecuredRouteFromRouteName(settings.name ?? '/');
//   log(MyRoutes.routes[1].name);
//
//   Uri? settingsUri;
//   if (route != null && settings.name != route.name) {
//     settingsUri = Uri.parse(Uri.parse(route.name).path);
//     if (settingsUri.queryParameters['next'] == null) {
//       settingsUri = settingsUri.replace(
//           queryParameters: {'next': Uri.parse(settings.name ?? "").path});
//     }
//   }
//
//   return PageRouteBuilder(
//     settings: RouteSettings(
//       arguments: settings.arguments,
//       name: settingsUri?.toString() ?? settings.name,
//     ),
//     pageBuilder: (context, animation1, animation2) =>
//         route != null ? route.builder(context) : const DashboardPage(),
//     transitionDuration: Duration.zero,
//     reverseTransitionDuration: Duration.zero,
//   );
// }
