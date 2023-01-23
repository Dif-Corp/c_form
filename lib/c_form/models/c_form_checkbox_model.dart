import 'package:flutter/material.dart';
import 'package:c_form/c_form/enums/required_check_list_enum.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/check_data_model.dart';

class CFormCheckBoxModel extends CFormFieldModel {
  List<CheckDataModel> items;
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
  List<int>? selectedItems;
  RequiredCheckListEnum? requiredCheckListEnum;

  final ValueChanged<CheckDataModel> callBack;

  CFormCheckBoxModel(
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
      this.requiredCheckListEnum,
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
      this.searchBoxDecoration,
      this.selectedItems})
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
