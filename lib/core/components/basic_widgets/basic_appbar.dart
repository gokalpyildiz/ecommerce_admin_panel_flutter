// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppbar({
    Key? key,
    this.titleWidget,
    this.titleStyle,
    this.titleCenter,
    this.onPressedBackButton,
    this.popIcon,
    this.popIconNavigate,
    this.actionWidgets,
    this.backButtonVisible = false,
    this.visitId,
    this.backGroundColor,
    this.elevationAppbar,
    this.spacingTitle,
    this.colorShadow,
  }) : super(key: key);
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final bool? titleCenter;
  final Function? onPressedBackButton;
  final Widget? popIcon;
  final AutoRoute? popIconNavigate;
  final List<Widget>? actionWidgets;
  final bool backButtonVisible;
  final int? visitId;
  final Color? backGroundColor;
  final double? elevationAppbar;
  final double? spacingTitle;
  final Color? colorShadow;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.backButtonVisible
          ? IconButton(
              icon: widget.popIcon ?? Icon(Icons.arrow_back),
              onPressed: () {
                widget.onPressedBackButton != null
                    ? widget.onPressedBackButton!()
                    : null;
              },
            )
          : null,
      automaticallyImplyLeading: false,
      title: widget.titleWidget,
      titleSpacing: widget.spacingTitle,
      centerTitle: widget.titleCenter,
      actions: widget.actionWidgets,
      titleTextStyle: widget.titleStyle,
      elevation: widget.elevationAppbar ?? 0,
      shadowColor: widget.colorShadow ?? Colors.transparent,
    );
  }
}
