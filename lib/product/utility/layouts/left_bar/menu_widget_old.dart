// import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// import '../../../../core/utils/widgets/custom_popup_menu.dart';
// import '../../../../core/utils/widgets/my_container.dart';
// import '../../../../core/utils/widgets/my_spacing.dart';
// import '../../../../core/utils/widgets/my_text.dart';
// import '../../../../core/utils/widgets/ui_mixin.dart';
// import '../../../services/url_services.dart';
// import 'left_bar.dart';
// import 'menu_item.dart';

// class MenuWidget extends StatefulWidget {
//   final IconData iconData;
//   final String title;
//   final bool isCondensed;
//   final bool active;
//   final List<MenuItem> children;

//   const MenuWidget(
//       {super.key,
//       required this.iconData,
//       required this.title,
//       this.isCondensed = false,
//       this.active = false,
//       this.children = const []});

//   @override
//   _MenuWidgetState createState() => _MenuWidgetState();
// }

// class _MenuWidgetState extends State<MenuWidget>
//     with UIMixin, SingleTickerProviderStateMixin {
//   bool isHover = false;
//   bool isActive = false;
//   late Animation<double> _iconTurns;
//   late AnimationController _controller;
//   bool popupShowing = true;
//   Function? hideFn;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         duration: const Duration(milliseconds: 200), vsync: this);
//     _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
//         .chain(CurveTween(curve: Curves.easeIn)));
//     LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
//   }

//   void onChangeMenuActive(String key) {
//     if (key != widget.title) {
//       // onChangeExpansion(false);
//     }
//   }

//   void onChangeExpansion(bool value) {
//     isActive = value;
//     if (isActive) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     var route = UrlService.getCurrentUrl();
//     isActive = widget.children.any((element) => element.route == route);
//     onChangeExpansion(isActive);
//     if (hideFn != null) {
//       hideFn!();
//     }
//     // popupShowing = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var route = Uri.base.fragment;
//     //todo üstteki gibiydi alttakiyle değiştirdim
//     var route = UrlService.getCurrentUrl();
//     isActive = widget.children.any((element) => element.route == route);
//     if (widget.isCondensed) {
//       return CustomPopupMenu(
//         backdrop: true,
//         show: popupShowing,
//         hideFn: (_) => hideFn = _,
//         onChange: (_) {
//           // popupShowing = _;
//         },
//         placement: CustomPopupMenuPlacement.right,
//         menu: MouseRegion(
//           cursor: SystemMouseCursors.click,
//           onHover: (event) {
//             setState(() {
//               isHover = true;
//             });
//           },
//           onExit: (event) {
//             setState(() {
//               isHover = false;
//             });
//           },
//           child: MyContainer.transparent(
//             margin: MySpacing.fromLTRB(16, 0, 16, 8),
//             color: isActive || isHover
//                 ? leftBarTheme.activeItemBackground
//                 : Colors.transparent,
//             padding: MySpacing.xy(8, 8),
//             child: Center(
//               child: Icon(
//                 widget.iconData,
//                 color: (isHover || isActive)
//                     ? leftBarTheme.activeItemColor
//                     : leftBarTheme.onBackground,
//                 size: 20,
//               ),
//             ),
//           ),
//         ),
//         menuBuilder: (_) => MyContainer.bordered(
//           paddingAll: 8,
//           width: 190,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: widget.children,
//           ),
//         ),
//       );
//     } else {
//       return MouseRegion(
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
//           margin: MySpacing.fromLTRB(24, 0, 16, 0),
//           paddingAll: 0,
//           child: ListTileTheme(
//             contentPadding: const EdgeInsets.all(0),
//             dense: true,
//             horizontalTitleGap: 0.0,
//             minLeadingWidth: 0,
//             child: ExpansionTile(
//                 tilePadding: MySpacing.zero,
//                 initiallyExpanded: isActive,
//                 maintainState: true,
//                 onExpansionChanged: (_) {
//                   LeftbarObserver.notifyAll(widget.title);
//                   onChangeExpansion(_);
//                 },
//                 trailing: RotationTransition(
//                   turns: _iconTurns,
//                   child: Icon(
//                     LucideIcons.chevronDown,
//                     size: 18,
//                     color: leftBarTheme.onBackground,
//                   ),
//                 ),
//                 iconColor: leftBarTheme.activeItemColor,
//                 childrenPadding: MySpacing.x(12),
//                 title: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       widget.iconData,
//                       size: 20,
//                       color: isHover || isActive
//                           ? leftBarTheme.activeItemColor
//                           : leftBarTheme.onBackground,
//                     ),
//                     MySpacing.width(18),
//                     Expanded(
//                       child: MyText.labelLarge(
//                         widget.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.start,
//                         color: isHover || isActive
//                             ? leftBarTheme.activeItemColor
//                             : leftBarTheme.onBackground,
//                       ),
//                     ),
//                   ],
//                 ),
//                 collapsedBackgroundColor: Colors.transparent,
//                 shape: const RoundedRectangleBorder(
//                   side: BorderSide(color: Colors.transparent),
//                 ),
//                 backgroundColor: Colors.transparent,
//                 children: widget.children),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//     // LeftbarObserver.detachListener(widget.title);
//   }
// }
