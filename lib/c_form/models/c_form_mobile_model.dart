import 'package:flutter/cupertino.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';

class CFormMobileModel extends CFormFieldModel {
  int? maxLength;
  String? hint;

  CFormMobileModel(
      {type,
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
      this.maxLength,
      this.hint})
      : super(
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
          focusNode: FocusNode(),
          showTitle: showTitle,
        );
}
