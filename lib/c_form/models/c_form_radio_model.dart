import 'package:flutter/material.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/radio_data_model.dart';

class CFormRadioModel extends CFormFieldModel {
  List<RadioDataModel> items;
  String? hint;
  Widget? selectedIcon;
  Widget? unSelectedIcon;
  bool? scrollable;
  double? height;
  Axis? scrollDirection;
  bool? showScrollBar;
  bool searchable;
  String? searchHint;
  Icon? searchIcon;
  BoxDecoration? searchBoxDecoration;
  Color? scrollBarColor;

  final ValueChanged<RadioDataModel> callBack;

  CFormRadioModel(
      {type,
      tag,
      title,
      errorMessage,
      helpMessage,
      required,
      status,
      value,
      weight,
      showTitle,
      required this.items,
      required this.callBack,
      this.selectedIcon,
      this.unSelectedIcon,
      this.hint,
      this.scrollable,
      this.height,
      this.scrollDirection,
      this.scrollBarColor,
      this.showScrollBar,
      required this.searchable,
      this.searchHint,
      this.searchIcon,
      this.searchBoxDecoration})
      : super(
          type: type,
          tag: tag,
          title: title,
          errorMessage: errorMessage,
          helpMessage: helpMessage,
          required: required,
          status: status,
          defaultValue: value,
          weight: weight,
          showTitle: showTitle,
        );
}
