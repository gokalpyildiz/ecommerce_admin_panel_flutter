// 
// import 'package:ecommerce_yildiz_flutter/product/constants/image_constants.dart';
// import 'package:ecommerce_yildiz_flutter/product/navigator/app_router.dart';
// import 'package:ecommerce_yildiz_flutter/product/utility/layouts/left_bar/cubit/left_bar_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// import '../../../../core/utils/theme/theme_customizer.dart';
// import '../../../../core/utils/widgets/my_card.dart';
// import '../../../../core/utils/widgets/my_shadow.dart';
// import '../../../../core/utils/widgets/my_spacing.dart';
// import '../../../../core/utils/widgets/my_text.dart';
// import '../../../../core/utils/widgets/ui_mixin.dart';
// import '../../../services/url_services.dart';
// import 'menu_item.dart';
// import 'menu_widget.dart';
// import 'navigation_item_old.dart';

// typedef LeftbarMenuFunction = void Function(String key);

// class LeftbarObserver {
//   static Map<String, LeftbarMenuFunction> observers = {};

//   static void attachListener(String key, LeftbarMenuFunction fn) {
//     observers[key] = fn;
//   }

//   static void detachListener(String key) {
//     observers.remove(key);
//   }

//   static void notifyAll(String key) {
//     for (var fn in observers.values) {
//       fn(key);
//     }
//   }
// }

// class LeftBar extends StatefulWidget {
//   final bool isCondensed;

//   const LeftBar({Key? key, this.isCondensed = false}) : super(key: key);

//   @override
//   _LeftBarState createState() => _LeftBarState();
// }

// class _LeftBarState extends State<LeftBar>
//     with SingleTickerProviderStateMixin, UIMixin {
//   final ThemeCustomizer customizer = ThemeCustomizer.instance;

//   bool isCondensed = false;
//   String path = UrlService.getCurrentUrl();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     isCondensed = widget.isCondensed;
//     return BlocProvider(
//       create: (context) => LeftBarCubit(),
//       child: BlocBuilder<LeftBarCubit, LeftBarState>(
//         builder: (context, state) {
//           return MyCard(
//             paddingAll: 0,
//             shadow: MyShadow(
//                 position: MyShadowPosition.centerRight, elevation: 0.2),
//             child: AnimatedContainer(
//               color: leftBarTheme.background,
//               width: isCondensed ? 70 : 254,
//               curve: Curves.easeInOut,
//               duration: const Duration(milliseconds: 200),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               //Get.toNamed('/dashboard');
//                               //todo .pushNamed ya da .push da olabilir.
//                               context.router.replaceNamed(AppRoute.dashboard);
//                             },
//                             child: Image.asset(
//                               //Images.logoIcon,
//                               ImagePath.instance.appIcon,
//                               //height: widget.isCondensed ? 24 : 32,
//                               height: widget.isCondensed ? 50 : 32,
//                               //color: contentTheme.primary,
//                             )),
//                         if (!widget.isCondensed)
//                           Flexible(
//                             fit: FlexFit.loose,
//                             child: MySpacing.width(16),
//                           ),
//                         //todo logo eklenmek istenirse açılsın
//                         // if (!widget.isCondensed)
//                         //   Flexible(
//                         //     fit: FlexFit.loose,
//                         //     child: MyText.labelLarge(
//                         //       "Jaliri",
//                         //       style: GoogleFonts.raleway(
//                         //         fontSize: 28,
//                         //         fontWeight: FontWeight.w800,
//                         //         color: theme.colorScheme.primary,
//                         //         letterSpacing: 1,
//                         //       ),
//                         //       maxLines: 1,
//                         //     ),
//                         //   )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                       child: SingleChildScrollView(
//                     physics: const PageScrollPhysics(),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         NavigationItem(
//                           iconData: LucideIcons.layoutDashboard,
//                           //title: "Dashboard" + DateTime.now().toString(),
//                           title: DateTime.now().millisecond.toString(),
//                           isCondensed: isCondensed,
//                           //route: '/dashboard',
//                           route: AppRoute.dashboard,
//                         ),
//                         //labelWidget("apps".tr()),

//                         //-----------------CALENDAR-----------------//
//                         // NavigationItem(
//                         //   iconData: LucideIcons.calendarDays,
//                         //   title: "calender".tr(),
//                         //   route: '/calender',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         //-----------------Chat-----------------//
//                         // NavigationItem(
//                         //   iconData: LucideIcons.messageSquare,
//                         //   title: "chat".tr(),
//                         //   route: '/chat',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         //-----------------Contact-----------------//
//                         MenuWidget(
//                           //iconData: LucideIcons.contact,
//                           iconData: LucideIcons.store,
//                           isCondensed: isCondensed,
//                           //title: "Contacts",
//                           title: 'Ürünler ve Kataloglar',
//                           children: [
//                             MenuItem(
//                               //title: "Members",
//                               //route: '/contacts/members',
//                               title: 'Ürün Havuzu',
//                               route: AppRoute.productPool,
//                               isCondensed: widget.isCondensed,
//                             ),
//                             MenuItem(
//                               // title: "profile".tr(),
//                               // route: '/contacts/profile',
//                               title: 'Ürün Özellikleri',
//                               route: AppRoute.productAttributes,
//                               isCondensed: widget.isCondensed,
//                             ),
//                             MenuItem(
//                               // title: "Edit Profile",
//                               // route: '/contacts/edit-profile',
//                               title: 'Ürün Özellik Setleri',
//                               route: AppRoute.productAttributesSet,
//                               isCondensed: widget.isCondensed,
//                             ),
//                             MenuItem(
//                               title: 'Fiyat Listesi',
//                               route: AppRoute.priceList,
//                               isCondensed: widget.isCondensed,
//                             ),
//                             MenuItem(
//                               title: 'Stok Listesi',
//                               route: AppRoute.stockList,
//                               isCondensed: widget.isCondensed,
//                             ),
//                           ],
//                         ),

//                         //-----------------CRM-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.users,
//                         //   isCondensed: isCondensed,
//                         //   title: 'CRM',
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "Contacts",
//                         //       route: '/crm/contacts',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Opportunities",
//                         //       route: '/crm/opportunities',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         // -----------------Ecommerce-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.store,
//                         //   isCondensed: isCondensed,
//                         //   title: "ecommerce".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "products".tr(),
//                         //       isCondensed: isCondensed,
//                         //       route: '/apps/ecommerce/products',
//                         //     ),
//                         //     MenuItem(
//                         //       title: "add_product".tr(),
//                         //       isCondensed: isCondensed,
//                         //       route: '/apps/ecommerce/add_product',
//                         //     ),
//                         //     MenuItem(
//                         //       title: "product_detail".tr(),
//                         //       isCondensed: isCondensed,
//                         //       route: '/apps/ecommerce/product-detail',
//                         //     ),
//                         //     MenuItem(
//                         //       title: "customers".tr(),
//                         //       isCondensed: isCondensed,
//                         //       route: '/apps/ecommerce/customers',
//                         //     ),
//                         //     MenuItem(
//                         //       title: "invoice".tr(),
//                         //       isCondensed: isCondensed,
//                         //       route: '/apps/ecommerce/invoice',
//                         //     ),
//                         //   ],
//                         // ),
//                         //-----------------File-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.folderPlus,
//                         //   isCondensed: isCondensed,
//                         //   title: "file".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "manager".tr(),
//                         //       route: '/apps/files',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "upload".tr(),
//                         //       route: '/apps/file-uploader',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         //-----------------Project-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.briefcase,
//                         //   isCondensed: isCondensed,
//                         //   title: "Projects",
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "Project List",
//                         //       route: '/projects/project-list',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Project Detail",
//                         //       route: '/projects/project-detail',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Create Project",
//                         //       route: '/projects/create-project',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         //-----------------KanBan-----------------//
//                         // NavigationItem(
//                         //   iconData: LucideIcons.squareKanban,
//                         //   title: "Kanban",
//                         //   route: '/kanban',
//                         //   isCondensed: isCondensed,
//                         // ),

//                         //-----------------NFT Dashboard-----------------//
//                         // NavigationItem(
//                         //   iconData: LucideIcons.circleDollarSign,
//                         //   title: "NFT Dashboard",
//                         //   route: '/NFTDashboard',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         // NavigationItem(
//                         //   iconData: LucideIcons.shoppingCart,
//                         //   title: "Customer",
//                         //   route: '/shopping-customer',
//                         //   isCondensed: isCondensed,
//                         // ),

//                         // labelWidget("pages".tr()),

//                         // //-----------------Landing-----------------//
//                         // NavigationItem(
//                         //   iconData: LucideIcons.presentation,
//                         //   title: "landing".tr(),
//                         //   route: '/ui/landing',
//                         //   isCondensed: isCondensed,
//                         // ),

//                         // //-----------------Auth-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.shieldAlert,
//                         //   isCondensed: isCondensed,
//                         //   title: "auth".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "login".tr(),
//                         //       route: '/auth/login',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "login2".tr(),
//                         //       route: '/auth/login1',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "register".tr(),
//                         //       route: '/auth/register',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "register2".tr(),
//                         //       route: '/auth/register1',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "forgot_password".tr(),
//                         //       route: '/auth/forgot-password',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "forgot_password2".tr(),
//                         //       route: '/auth/forgot_password1',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "reset_password".tr(),
//                         //       route: '/auth/reset_password',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "reset_password2".tr(),
//                         //       route: '/auth/reset_password1',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "locked".tr(),
//                         //       route: '/auth/locked',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "locked2".tr(),
//                         //       route: '/auth/locked1',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         // //-----------------Error-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.alertCircle,
//                         //   isCondensed: isCondensed,
//                         //   title: 'Error',
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "ERROR-404",
//                         //       route: '/error-404',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "ERROR-500",
//                         //       route: '/error-500',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Coming Soon",
//                         //       route: '/coming-soon',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Maintenance",
//                         //       route: '/maintenance',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         // //-----------------Extra Pages-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.bookOpenCheck,
//                         //   isCondensed: isCondensed,
//                         //   title: "Extra Pages",
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "FAQs".tr(),
//                         //       route: '/faqs',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "pricing".tr(),
//                         //       route: '/pricing',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "TimeLine",
//                         //       isCondensed: isCondensed,
//                         //       route: '/timeline',
//                         //     ),
//                         //   ],
//                         // ),

//                         // //-----------------Forms-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.formInput,
//                         //   isCondensed: isCondensed,
//                         //   title: "form".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "basic".tr(),
//                         //       route: '/form/basic',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Form Mask".tr(),
//                         //       route: '/form/form-mask',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Quill Editor".tr(),
//                         //       route: '/form/quill-editor',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "validation".tr(),
//                         //       route: '/form/validation',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "wizard".tr(),
//                         //       route: '/form/wizard',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),
//                         // //-----------------UI Widget-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.layoutGrid,
//                         //   isCondensed: isCondensed,
//                         //   title: "widgets".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "buttons".tr(),
//                         //       route: '/ui/buttons',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "cards".tr(),
//                         //       route: '/ui/cards',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "tabs".tr(),
//                         //       route: '/ui/tabs',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "dialogs".tr(),
//                         //       route: '/ui/dialogs',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "carousels".tr(),
//                         //       route: '/ui/carousels',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "drag_drop".tr(),
//                         //       route: '/ui/drag-drop',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "notifications".tr(),
//                         //       route: '/ui/notification',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         // NavigationItem(
//                         //   iconData: LucideIcons.file,
//                         //   title: "starter".tr(),
//                         //   route: '/starter',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         // //-----------------Other-----------------//
//                         // labelWidget("other".tr()),
//                         // NavigationItem(
//                         //   iconData: LucideIcons.table2,
//                         //   title: "basic_tables".tr(),
//                         //   route: '/other/basic_tables',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         // NavigationItem(
//                         //   iconData: LucideIcons.barChartBig,
//                         //   title: "syncfusion_charts".tr(),
//                         //   route: '/other/syncfusion_charts',
//                         //   isCondensed: isCondensed,
//                         // ),
//                         // //-----------------Maps-----------------//
//                         // MenuWidget(
//                         //   iconData: LucideIcons.map,
//                         //   isCondensed: isCondensed,
//                         //   title: "maps".tr(),
//                         //   children: [
//                         //     MenuItem(
//                         //       title: "Sf Maps".tr(),
//                         //       route: '/maps/sf-maps',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //     MenuItem(
//                         //       title: "Google Maps".tr(),
//                         //       route: '/maps/google-maps',
//                         //       isCondensed: widget.isCondensed,
//                         //     ),
//                         //   ],
//                         // ),

//                         // MySpacing.height(16),
//                         // if (!isCondensed)
//                         //   Center(
//                         //     child: MyButton(
//                         //         borderRadiusAll: AppStyle.buttonRadius.small,
//                         //         elevation: 0,
//                         //         padding: MySpacing.xy(12, 16),
//                         //         onPressed: () {
//                         //           UrlService.goToPurchase();
//                         //         },
//                         //         backgroundColor: theme.colorScheme.primary,
//                         //         child: MyText.labelMedium(
//                         //           'purchase_now'.tr(),
//                         //           color: theme.colorScheme.onPrimary,
//                         //         )),
//                         //   ),
//                         MySpacing.height(32),
//                       ],
//                     ),
//                   ))
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget labelWidget(String label) {
//     return isCondensed
//         ? MySpacing.empty()
//         : Container(
//             padding: MySpacing.xy(24, 8),
//             child: MyText.labelSmall(
//               label.toUpperCase(),
//               color: leftBarTheme.labelColor,
//               muted: true,
//               maxLines: 1,
//               overflow: TextOverflow.clip,
//               fontWeight: 700,
//             ),
//           );
//   }
// }
