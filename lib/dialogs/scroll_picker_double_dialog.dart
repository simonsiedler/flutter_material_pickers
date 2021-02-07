// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';

import 'responsive_dialog.dart';
import '../interfaces/common_dialog_properties.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ScrollPickerDoubleDialog extends StatefulWidget implements ICommonDialogProperties {
  ScrollPickerDoubleDialog({
    this.title,
    this.items1,
    this.items2,
    this.initialItem1,
    this.initialItem2,
    this.separator: ".",
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.showDivider: false,
    this.confirmText,
    this.cancelText,
  });

  // Variables
  final List<String> items1;
  final List<String> items2;
  final String initialItem1;
  final String initialItem2;
  final String separator;
  @override
  final String title;
  @override
  final Color headerColor;
  @override
  final Color headerTextColor;
  @override
  final Color backgroundColor;
  @override
  final Color buttonTextColor;
  @override
  final double maxLongSide;
  @override
  final double maxShortSide;
  @override
  final String confirmText;
  @override
  final String cancelText;

  final bool showDivider;

  @override
  State<ScrollPickerDoubleDialog> createState() => _ScrollPickerDoubleDialogState(initialItem1, initialItem2);
}

class _ScrollPickerDoubleDialogState extends State<ScrollPickerDoubleDialog> {
  _ScrollPickerDoubleDialogState(this.selectedItem1, this.selectedItem2);

  String selectedItem1;
  String selectedItem2;

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    return ResponsiveDialog(
      context: context,
      title: widget.title,
      headerColor: widget.headerColor,
      headerTextColor: widget.headerTextColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      maxLongSide: widget.maxLongSide,
      maxShortSide: widget.maxLongSide,
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: Row(
        children: [
          Expanded(
            child: ScrollPicker(
              items: widget.items1,
              initialValue: selectedItem1,
              showDivider: widget.showDivider,
              onChanged: (value) => setState(() => selectedItem1 = value),
            ),
          ),
          Text(widget.separator),
          Expanded(
            child: ScrollPicker(
              items: widget.items2,
              initialValue: selectedItem2,
              showDivider: widget.showDivider,
              onChanged: (value) => setState(() => selectedItem2 = value),
            ),
          ),
        ],
      ),
      okPressed: () => Navigator.of(context).pop([selectedItem1, selectedItem2]),
    );
  }
}
