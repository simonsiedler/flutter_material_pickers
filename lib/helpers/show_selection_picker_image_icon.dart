// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/selection_picker_dialog_image_icon.dart';

/// Allows selection of a single value via an icon label list
void showMaterialSelectionPickerImageIcon({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  List<Image> icons,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  String confirmText,
  String cancelText,
  double maxLongSide,
  double maxShortSide,
  ValueChanged<String> onChanged,
  VoidCallback onConfirmed,
  VoidCallback onCancelled,
}) {
  assert(items != null);
  assert(icons == null || items.length == icons.length);

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SelectionPickerDialogImageIcon(
        items: items,
        title: title,
        initialItem: selectedItem,
        icons: icons,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
