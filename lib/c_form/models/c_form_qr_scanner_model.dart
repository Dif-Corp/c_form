import 'package:flutter/cupertino.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';

class CFormQRScannerModel extends CFormFieldModel {
  String? hint;
  Widget? iconWidget;

  CFormQRScannerModel({
    type,
    tag,
    title,
    errorMessage,
    helpMessage,
    required,
    status,
    weight,
    showTitle,
    this.hint,
    this.iconWidget,
  }) : super(
          type: type,
          tag: tag,
          title: title,
          errorMessage: errorMessage,
          helpMessage: helpMessage,
          required: required,
          status: status,
          weight: weight,
          showTitle: showTitle,
        );
}
