import 'package:flutter/material.dart';

import 'dialogs.dart';

Future<void> showSelectItemDialog({
  required BuildContext context,
  Function? onTapCancelButton,
  required void Function(List<int> selectedIndexes) onTapConfirmButton,
  required String title,
  String? confirmButtonTitle,
  String? cancelButtonTitle,
  required List<String> list,
  required List<int> selectedIndexList,
  //String? description,
}) async {
  //await Future.delayed(Duration(microseconds: 1));
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => SelectItemDialog(
            onTapCancelButton: onTapCancelButton,
            onTapConfirmButton: onTapConfirmButton,
            title: title,
            yesButtonTitle: confirmButtonTitle,
            noButtonTitle: cancelButtonTitle,
            list: list,
            selectedIndexList: selectedIndexList,
            //description: description,
          ));
}
