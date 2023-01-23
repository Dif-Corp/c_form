import 'package:flutter/material.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';

class CFormTimePickerModel extends CFormFieldModel {
  String? hint;
  TimeOfDay? initialTime;

  CFormTimePickerModel({
    type,
    tag,
    title,
    errorMessage,
    helpMessage,
    prefixWidget,
    postfixWidget,
    required,
    status,
    value,
    validateReg,
    weight,
    showTitle,
    this.hint,
    this.initialTime,
  }) : super(
          type: type,
          tag: tag,
          title: title,
          errorMessage: errorMessage,
          helpMessage: helpMessage,
          prefixWidget: prefixWidget,
          postfixWidget: postfixWidget,
          required: required,
          status: status,
          defaultValue: value,
          validateRegEx: validateReg,
          weight: weight,
          showTitle: showTitle,
        );
}
