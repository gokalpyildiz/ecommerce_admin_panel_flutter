import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/widgets/my_button.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';

class SelectItemDialog extends StatefulWidget {
  const SelectItemDialog(
      {super.key,
      //this.description,
      this.yesButtonTitle,
      this.noButtonTitle,
      this.title,
      this.onTapCancelButton,
      this.list,
      required this.selectedIndexList,
      this.onTapConfirmButton});
  //final String? description;
  final String? yesButtonTitle;
  final String? noButtonTitle;
  final String? title;
  final Function? onTapCancelButton;
  final void Function(List<int> selectedIndex)? onTapConfirmButton;
  final List<String>? list;
  final List<int> selectedIndexList;

  @override
  State<SelectItemDialog> createState() => _SelectItemDialogState();
}

class _SelectItemDialogState extends State<SelectItemDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: MyText.labelLarge(widget.title ?? ''),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(16),
              //child: MyText.bodySmall(description ?? ''),
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (var item in widget.list!)
                    CheckboxListTile(
                      title: MyText.bodySmall(item),
                      value: widget.selectedIndexList
                          .contains(widget.list!.indexOf(item)),
                      onChanged: (bool? value) {
                        if (value == true) {
                          widget.selectedIndexList
                              .add(widget.list!.indexOf(item));
                          setState(() {});
                        } else {
                          widget.selectedIndexList
                              .remove(widget.list!.indexOf(item));
                          setState(() {});
                        }
                      },
                    ),
                ],
              ),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(16),
              child: _buttons(context),
            ),
          ],
        ),
      ),
    );
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyButton.rounded(
          onPressed: () {
            if (widget.onTapCancelButton != null) {
              widget.onTapCancelButton!();
            } else {
              Navigator.pop(context);
            }
          },
          elevation: 0,
          padding: MySpacing.xy(20, 16),
          backgroundColor: theme.colorScheme.secondaryContainer,
          child: MyText.labelMedium(
            widget.noButtonTitle ?? 'Cancel',
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ),
        MySpacing.width(16),
        MyButton.rounded(
          onPressed: () {
            if (widget.onTapConfirmButton != null) {
              widget.onTapConfirmButton!(widget.selectedIndexList);
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          elevation: 0,
          padding: MySpacing.xy(20, 16),
          backgroundColor: theme.colorScheme.primary,
          child: MyText.labelMedium(
            widget.yesButtonTitle ?? 'Confirm',
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
