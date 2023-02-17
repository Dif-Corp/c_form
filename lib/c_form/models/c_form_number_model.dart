import 'package:flutter/cupertino.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';

class CFormNumberModel extends CFormFieldModel {
  int? maxLength;
  String? hint;
  bool? showCounter;

  CFormNumberModel(
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
      validateRegEx,
      weight,
      focusNode,
      showTitle,
      this.showCounter,
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
          validateRegEx: validateRegEx,
          weight: weight,
          focusNode: FocusNode(),
          showTitle: showTitle,
        );
}
