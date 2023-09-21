import 'package:ecommerce_yildiz_flutter/product/navigator/getx_router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/theme/theme_customizer.dart';
import '../../../../core/utils/widgets/my_card.dart';
import '../../../../core/utils/widgets/my_shadow.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';
import '../../../../core/utils/widgets/ui_mixin.dart';
import '../../../constants/image_constants.dart';
import '../../../services/url_services.dart';
import 'menu_item.dart';
import 'menu_widget.dart';
import 'navigation_item.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static void attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static void detachListener(String key) {
    observers.remove(key);
  }

  static void notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({Key? key, this.isCondensed = false}) : super(key: key);

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar>
    with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = UrlService.getCurrentUrl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
      child: AnimatedContainer(
        color: leftBarTheme.background,
        width: isCondensed ? 70 : 300,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(AppPages.dashboard);
                        //context.router.replaceNamed(AppRoute.dashboard);
                      },
                      child: Image.asset(
                        //Images.logoIcon,
                        ImagePath.instance.appIcon,
                        //height: widget.isCondensed ? 24 : 32,
                        //height: widget.isCondensed ? 50 : 32,
                        //color: contentTheme.primary,
                      )),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: MySpacing.width(16),
                    ),
                  //todo logo eklenmek istenirse açılsın
                  // if (!widget.isCondensed)
                  //   Flexible(
                  //     fit: FlexFit.loose,
                  //     child: MyText.labelLarge(
                  //       "Jaliri",
                  //       style: GoogleFonts.raleway(
                  //         fontSize: 28,
                  //         fontWeight: FontWeight.w800,
                  //         color: theme.colorScheme.primary,
                  //         letterSpacing: 1,
                  //       ),
                  //       maxLines: 1,
                  //     ),
                  //   )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationItem(
                    iconData: LucideIcons.layoutDashboard,
                    title: "Dashboard",
                    //title: DateTime.now().millisecond.toString(),
                    isCondensed: isCondensed,
                    route: AppPages.dashboard,
                    //route: AppRoute.dashboard,
                  ),
                  //labelWidget("apps".tr()),

                  //-----------------CALENDAR-----------------//
                  // NavigationItem(
                  //   iconData: LucideIcons.calendarDays,
                  //   title: "calender".tr(),
                  //   route: '/calender',
                  //   isCondensed: isCondensed,
                  // ),
                  //-----------------Chat-----------------//
                  // NavigationItem(
                  //   iconData: LucideIcons.messageSquare,
                  //   title: "chat".tr(),
                  //   route: '/chat',
                  //   isCondensed: isCondensed,
                  // ),
                  //-----------------Contact-----------------//
                  MenuWidget(
                    //iconData: LucideIcons.contact,
                    iconData: LucideIcons.store,
                    isCondensed: isCondensed,
                    //title: "Contacts",
                    title: 'Ürünler ve Kataloglar',
                    children: [
                      MenuItem(
                        //title: "Members",
                        route: AppPages.productPool,
                        title: 'Ürün Havuzu',
                        //route: AppRoute.productPool,
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        // title: "profile".tr(),
                        route: AppPages.productAttributes,
                        title: 'Ürün Özellikleri',
                        //route: AppRoute.productAttributes,
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        // title: "Edit Profile",
                        route: AppPages.productAttributesSet,
                        title: 'Ürün Özellik Setleri',
                        //route: AppRoute.productAttributesSet,
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Fiyat Listesi',
                        route: AppPages.priceList,
                        //route: AppRoute.priceList,
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Stok Listesi',
                        route: AppPages.stockList,
                        //route: AppRoute.stockList,
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  // NavigationItem(
                  //   iconData: Icons.dashboard_outlined,
                  //   title: "dashboard",
                  //   isCondensed: isCondensed,
                  //   route: '/dashboard',
                  // ),
                  // labelWidget("apps"),
                  // MenuWidget(
                  //   iconData: Icons.storefront_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "ecommerce",
                  //   children: [
                  //     MenuItem(
                  //       title: "products",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/products',
                  //     ),
                  //     MenuItem(
                  //       title: "add_product",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/add_product',
                  //     ),
                  //     MenuItem(
                  //       title: "product_detail",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/product-detail',
                  //     ),
                  //     MenuItem(
                  //       title: "reviews",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/product-reviews',
                  //     ),
                  //     MenuItem(
                  //       title: "customers",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/customers',
                  //     ),
                  //     MenuItem(
                  //       title: "invoice",
                  //       isCondensed: isCondensed,
                  //       route: '/apps/ecommerce/invoice',
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //     iconData: Icons.work_outline_rounded,
                  //     isCondensed: isCondensed,
                  //     title: "jobs",
                  //     children: [
                  //       MenuItem(
                  //         title: "discover",
                  //         route: '/apps/jobs/discover',
                  //         isCondensed: widget.isCondensed,
                  //       ),
                  //       MenuItem(
                  //         title: "candidates",
                  //         route: '/apps/jobs/candidates',
                  //         isCondensed: widget.isCondensed,
                  //       ),
                  //       MenuItem(
                  //         title: "vacancies",
                  //         route: '/apps/jobs/vacancies',
                  //         isCondensed: widget.isCondensed,
                  //       ),
                  //     ]),
                  // MenuWidget(
                  //     iconData: Icons.create_new_folder_outlined,
                  //     isCondensed: isCondensed,
                  //     title: "files",
                  //     children: [
                  //       MenuItem(
                  //         title: "manager",
                  //         route: '/apps/files',
                  //         isCondensed: widget.isCondensed,
                  //       ),
                  //       MenuItem(
                  //         title: "upload",
                  //         route: '/apps/files/upload',
                  //         isCondensed: widget.isCondensed,
                  //       ),
                  //     ]),
                  // NavigationItem(
                  //   iconData: Icons.currency_exchange_outlined,
                  //   title: "nft_dashboard",
                  //   route: '/nft/dashboard',
                  //   isCondensed: isCondensed,
                  // ),
                  // // NavigationItem(
                  // //   iconData: Icons.question_answer_outlined,
                  // //   title: "chats",
                  // //   route: '/chats',
                  // //   isCondensed: isCondensed,
                  // // ),
                  // labelWidget("pages"),
                  // MenuWidget(
                  //   iconData: Icons.admin_panel_settings_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "auth",
                  //   children: [
                  //     MenuItem(
                  //       title: "login",
                  //       route: '/auth/login',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "register",
                  //       route: '/auth/register',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "forgot_password",
                  //       route: '/auth/forgot_password',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "reset_password",
                  //       route: '/auth/reset_password',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "locked",
                  //       route: '/auth/locked',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.widgets_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "widgets",
                  //   children: [
                  //     MenuItem(
                  //       title: "buttons",
                  //       route: '/ui/buttons',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "cards",
                  //       route: '/ui/cards',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "tabs",
                  //       route: '/ui/tabs',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "dialogs",
                  //       route: '/ui/dialogs',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "carousels",
                  //       route: '/ui/carousels',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "drag_drop",
                  //       route: '/ui/drag_drop',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "notifications",
                  //       route: '/ui/notifications',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.post_add_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "form",
                  //   children: [
                  //     MenuItem(
                  //       title: "basic",
                  //       route: '/forms/basic',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "validations",
                  //       route: '/forms/validation',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "html_editor",
                  //       route: '/forms/html_editor',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "masks",
                  //       route: '/forms/masks',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "wizard",
                  //       route: '/forms/wizard',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.note_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "extra",
                  //   children: [
                  //     MenuItem(
                  //       title: "profile",
                  //       route: '/pages/profile',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "success",
                  //       route: '/pages/success',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "coming_soon",
                  //       route: '/pages/coming-soon',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "error_404",
                  //       route: '/pages/error-404',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "error_404_alt",
                  //       route: '/pages/error-404-alt',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "error_404_cover",
                  //       route: '/pages/error-404-cover',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "error_500",
                  //       route: '/pages/error-500',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "offline",
                  //       route: '/pages/offline',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "maintenance",
                  //       route: '/pages/maintenance',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.attach_money_outlined,
                  //   title: "pricing",
                  //   route: '/pricing',
                  //   isCondensed: isCondensed,
                  // ),

                  // NavigationItem(
                  //   iconData: Icons.list_alt_rounded,
                  //   title: "FAQs",
                  //   route: '/faqs',
                  //   isCondensed: isCondensed,
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.insert_drive_file_outlined,
                  //   title: "starter",
                  //   route: '/starter',
                  //   isCondensed: isCondensed,
                  // ),
                  // labelWidget("other"),
                  // NavigationItem(
                  //   iconData: Icons.table_chart_outlined,
                  //   title: "basic_tables",
                  //   route: '/other/basic_tables',
                  //   isCondensed: isCondensed,
                  // ),
                  // NavigationItem(
                  //   iconData: Icons.insert_chart_outlined,
                  //   title: "syncfusion_chart",
                  //   route: '/other/syncfusion_charts',
                  //   isCondensed: isCondensed,
                  // ),
                  // MenuWidget(
                  //   iconData: Icons.map_outlined,
                  //   isCondensed: isCondensed,
                  //   title: "maps",
                  //   children: [
                  //     MenuItem(
                  //       title: "google_map",
                  //       route: '/maps/google_maps',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //     MenuItem(
                  //       title: "leaflet",
                  //       route: '/maps/leaflet',
                  //       isCondensed: widget.isCondensed,
                  //     ),
                  //   ],
                  // ),
                  // MySpacing.height(16),
                  // if (!isCondensed)
                  //   Center(
                  //     child: MyButton(
                  //         borderRadiusAll: AppStyle.buttonRadius.small,
                  //         elevation: 0,
                  //         padding: MySpacing.xy(12, 16),
                  //         onPressed: () {
                  //           UrlService.goToPurchase();
                  //         },
                  //         backgroundColor: theme.colorScheme.primary,
                  //         child: MyText.labelMedium(
                  //           'purchase_now',
                  //           color: theme.colorScheme.onPrimary,
                  //         )),
                  //   ),
                  MySpacing.height(32),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(
              label.toUpperCase(),
              color: leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}


// class NavigationItem extends StatefulWidget {
//   final IconData? iconData;
//   final String title;
//   final bool isCondensed;
//   final String? route;

//   const NavigationItem(
//       {Key? key,
//       this.iconData,
//       required this.title,
//       this.isCondensed = false,
//       this.route})
//       : super(key: key);

//   @override
//   _NavigationItemState createState() => _NavigationItemState();
// }

// class _NavigationItemState extends State<NavigationItem> with UIMixin {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     bool isActive = UrlService.getCurrentUrl() == widget.route;
//     return GestureDetector(
//       onTap: () {
//         if (widget.route != null) {
//           //Get.toNamed(widget.route!);
//           context.router.pushNamed(widget.route!);
//         }
//       },
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         onHover: (event) {
//           setState(() {
//             isHover = true;
//           });
//         },
//         onExit: (event) {
//           setState(() {
//             isHover = false;
//           });
//         },
//         child: MyContainer.transparent(
//           margin: MySpacing.fromLTRB(16, 0, 16, 8),
//           color: isActive || isHover
//               ? leftBarTheme.activeItemBackground
//               : Colors.transparent,
//           padding: MySpacing.xy(8, 8),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (widget.iconData != null)
//                 Center(
//                   child: Icon(
//                     widget.iconData,
//                     color: (isHover || isActive)
//                         ? leftBarTheme.activeItemColor
//                         : leftBarTheme.onBackground,
//                     size: 20,
//                   ),
//                 ),
//               if (!widget.isCondensed)
//                 Flexible(
//                   fit: FlexFit.loose,
//                   child: MySpacing.width(16),
//                 ),
//               if (!widget.isCondensed)
//                 Expanded(
//                   flex: 3,
//                   child: MyText.labelLarge(
//                     widget.title,
//                     overflow: TextOverflow.clip,
//                     maxLines: 1,
//                     color: isActive || isHover
//                         ? leftBarTheme.activeItemColor
//                         : leftBarTheme.onBackground,
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
