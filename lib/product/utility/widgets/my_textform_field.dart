import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/widgets/my_spacing.dart';
import '../../../core/utils/widgets/my_text_style.dart';

class MyTextFormField extends StatelessWidget with UIMixin {
  const MyTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.minLine,
    this.multiLine = false,
  });
  final String? hintText;
  final TextEditingController? controller;
  final String Function(String?)? validator;
  final int? minLine;
  final bool multiLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      minLines: multiLine ? minLine ?? 1 : 1,
      maxLines: multiLine ? minLine ?? 4 : 1,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: focusedInputBorder,
          contentPadding: MySpacing.all(16),
          isCollapsed: true,
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}
