import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/utils/theme/app_theme.dart';
import '../../../core/utils/widgets/my_spacing.dart';
import '../../../core/utils/widgets/my_text_style.dart';

class MyDropDown<T> extends StatelessWidget with UIMixin {
  const MyDropDown(
      {super.key,
      this.hintText,
      this.controller,
      this.validator,
      this.callback,
      required this.modelList});
  final String? hintText;
  final TextEditingController? controller;
  final String Function(String?)? validator;
  final List<T?> modelList;
  final void Function(T?)? callback;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      dropdownColor: theme.colorScheme.background,
      menuMaxHeight: 200,
      items: modelList.map((T? value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (value) {
        if (callback == null) return;
        callback!(value);
      },
      icon: const Icon(
        LucideIcons.chevronDown,
        size: 20,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: focusedInputBorder,
          contentPadding: MySpacing.all(16),
          isCollapsed: true,
          floatingLabelBehavior: FloatingLabelBehavior.never),
      //todo validator vs eklenebilir
    );
  }
}
