import 'package:flutter/cupertino.dart';
import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_field_type_enum.dart';

abstract class CFormFieldModel<T> {
  CFormFieldTypeEnum? type;
  String? title;
  String tag;
  String? errorMessage;
  String? helpMessage;
  Widget? prefixWidget;
  Widget? postfixWidget;
  bool? required;
  bool? showTitle;

  CFormFieldStatusEnum status;

  dynamic defaultValue;
  RegExp? validateRegEx;
  int? weight;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;

  CFormFieldModel({
    this.type,
    required this.tag,
    this.showTitle,
    this.title,
    this.errorMessage,
    this.helpMessage,
    this.prefixWidget,
    this.postfixWidget,
    this.required,
    this.defaultValue,
    this.validateRegEx,
    this.weight,
    this.focusNode,
    this.nextFocusNode,
    CFormFieldStatusEnum? status,
  }) : status = status ?? CFormFieldStatusEnum.normal;
}
