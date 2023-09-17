// import 'package:auto_route/auto_route.dart';
// import 'package:ecommerce_yildiz_flutter/product/utility/layouts/left_bar/cubit/left_bar_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/utils/widgets/my_container.dart';
// import '../../../../core/utils/widgets/my_spacing.dart';
// import '../../../../core/utils/widgets/my_text.dart';
// import '../../../../core/utils/widgets/ui_mixin.dart';
// import '../../../services/url_services.dart';

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
//     var a = UrlService.getCurrentUrl();
//     var cubit = context.read<LeftBarCubit>();
//     return GestureDetector(
//       onTap: () {
//         if (widget.route != null) {
//           //Get.toNamed(widget.route!);
//           context.router.pushNamed(widget.route!);
//           //todo navigate to route
//           // MyRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
//         }
//       },
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         onHover: (event) {
//           //todo kontrol setstate
//           //setState(() {
//           isHover = true;
//           cubit.setState();
//           //});
//         },
//         onExit: (event) {
//           //setState(() {
//           isHover = false;
//           cubit.setState();
//           //});
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