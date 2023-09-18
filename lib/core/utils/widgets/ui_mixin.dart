import 'package:flutter/material.dart';

import '../theme/admin_theme.dart';
import 'my_dashed_divider.dart';

mixin UIMixin {
  // ThemeData get theme => AppStyle.theme;
  LeftBarTheme get leftBarTheme => AdminTheme.theme.leftBarTheme;

  TopBarTheme get topBarTheme => AdminTheme.theme.topBarTheme;

  RightBarTheme get rightBarTheme => AdminTheme.theme.rightBarTheme;

  ContentTheme get contentTheme => AdminTheme.theme.contentTheme;

  VisualDensity get getCompactDensity =>
      VisualDensity(horizontal: -4, vertical: -4);

  // theme.colorScheme. get theme.colorScheme. => theme.theme.colorScheme.;

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 1,
          strokeAlign: 0,
          //todo tema hazır olunca değişecek
          //color: theme.colorScheme.onBackground.withAlpha(80),
        ),
      );

  OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      width: 1,
      //todo tema hazır olunca değişecek
      //color: theme.colorScheme.primary,
    ),
  );

  OutlineInputBorder generateOutlineInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );

  OutlineInputBorder generateFocusedInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: 1,
          //todo tema hazır olunca değişecek
          //color: theme.colorScheme.primary,
        ),
      );

  //Widget getBackButton(MyNavigationMixin navigationMixin) {
  //todo üstteki şekilde generic yapılmalı.
  Widget getBackButton(BuildContext context) {
    return InkWell(
      //onTap: context.back,
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Icon(
          Icons.chevron_left_rounded,
          size: 26,
          //todo theme hazır olunca değişecek
          //color: context.colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget getDashedDivider() {
    return MyDashedDivider(
        dashWidth: 6,
        dashSpace: 4,
        //todo theme hazır olunca değişecek
        //color: theme.colorScheme.onBackground.withAlpha(64),
        height: 0.5);
  }
}
