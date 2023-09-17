// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/utils/widgets/my_container.dart';
// import '../../../../core/utils/widgets/my_spacing.dart';
// import '../../../../core/utils/widgets/my_text.dart';
// import '../../../../core/utils/widgets/ui_mixin.dart';
// import '../../../services/url_services.dart';

// class MenuItem extends StatefulWidget {
//   final IconData? iconData;
//   final String title;
//   final bool isCondensed;
//   final String? route;

//   const MenuItem({
//     Key? key,
//     this.iconData,
//     required this.title,
//     this.isCondensed = false,
//     this.route,
//   }) : super(key: key);

//   @override
//   _MenuItemState createState() => _MenuItemState();
// }

// class _MenuItemState extends State<MenuItem> with UIMixin {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     bool isActive = UrlService.getCurrentUrl() == widget.route;
//     return GestureDetector(
//       onTap: () {
//         if (widget.route != null) {
//           //Get.toNamed(widget.route!);
//           //todo navigate to route
//           context.router.pushNamed(widget.route!);
//           // MyRouter.pushReplacementNamed(context, widget.route!, arguments: 1); template kullanmıyor
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
//           margin: MySpacing.fromLTRB(4, 0, 8, 4),
//           color: isActive || isHover
//               ? leftBarTheme.activeItemBackground
//               : Colors.transparent,
//           width: MediaQuery.of(context).size.width,
//           padding: MySpacing.xy(18, 7),
//           child: MyText.bodySmall(
//             "${widget.isCondensed ? "" : "- "}  ${widget.title}",
//             overflow: TextOverflow.clip,
//             maxLines: 1,
//             textAlign: TextAlign.left,
//             fontSize: 12.5,
//             color: isActive || isHover
//                 ? leftBarTheme.activeItemColor
//                 : leftBarTheme.onBackground,
//             fontWeight: isActive || isHover ? 600 : 500,
//           ),
//         ),
//       ),
//     );
//   }
// }