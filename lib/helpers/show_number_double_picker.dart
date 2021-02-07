// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_double_dialog.dart';

/// Allows selection of a number via a slot machine carousel
void showMaterialNumberDoublePicker({
  BuildContext context,
  String title,
  final int minNumber1,
  final int maxNumber1,
  final int selectedNumber1,
  final int minNumber2,
  final int maxNumber2,
  final int selectedNumber2,
  final String separator,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  String confirmText,
  String cancelText,
  double maxLongSide,
  double maxShortSide,
  ValueChanged<List<int>> onChanged,
  VoidCallback onConfirmed,
  VoidCallback onCancelled,
}) {
  var items1 = List<String>.generate(maxNumber1 - minNumber1 + 1, (i) => (i + minNumber1).toString());
  var items2 = List<String>.generate(maxNumber2 - minNumber2 + 1, (i) => (i + minNumber2).toString());

  showDialog<List<String>>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDoubleDialog(
        items1: items1,
        items2: items2,
        title: title,
        initialItem1: selectedNumber1.toString(),
        initialItem2: selectedNumber2.toString(),
        separator: separator,
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
    if (onChanged != null && selection != null) onChanged([int.parse(selection[0]), int.parse(selection[1])]);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
