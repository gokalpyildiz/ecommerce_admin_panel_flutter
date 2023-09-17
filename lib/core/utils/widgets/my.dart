import 'package:flutter/material.dart';

import '../../constants/my_constants.dart';
import '../../../product/utility/layouts/my_screen_media.dart';
import '../theme/app_style.dart';
import 'my_text_style.dart';

class My {
  // entry point of the package
  void init() {
    return;
  }

  static void changeTheme(ThemeData theme) {
    AppTheme.theme = theme;
  }

  static void setTextDirection(TextDirection direction) {
    AppTheme.textDirection = direction;
  }

  static void changeFontFamily(GoogleFontFunction fontFamily) {
    MyTextStyle.changeFontFamily(fontFamily);
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    MyTextStyle.changeDefaultFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextFontWeight(
      Map<MyTextType, int> defaultFontWeight) {
    MyTextStyle.changeDefaultTextFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextSize(Map<MyTextType, double> defaultTextSize) {
    MyTextStyle.changeDefaultTextSize(defaultTextSize);
  }

  static void changeDefaultLetterSpacing(
      Map<MyTextType, double> defaultLetterSpacing) {
    MyTextStyle.changeDefaultLetterSpacing(defaultLetterSpacing);
  }

  static void setConstant(MyConstantData constantData) {
    MyConstant.setConstant(constantData);
  }

  static void setFlexSpacing(double spacing) {
    MyScreenMedia.flexSpacing = spacing;
  }

  static void setFlexColumns(int columns) {
    MyScreenMedia.flexColumns = columns;
  }
}
