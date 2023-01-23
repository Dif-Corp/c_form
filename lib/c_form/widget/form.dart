import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/c_form_utils.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/widget/c_form_field.dart';
import 'package:c_form/c_form/widget/c_form_section.dart';
import 'package:c_form/c_form_platform_interface.dart';
import 'package:flutter/material.dart';

class CForm extends StatelessWidget {
  Future<String?> getPlatformVersion() {
    return CFormPlatform.instance.getPlatformVersion();
  }

  CFormStyle? style;
  late List<CFormSection> sections;
  late List<Widget> fields;

  CForm.singleSection(BuildContext context,
      {Key? key, this.style, required this.fields})
      : super(key: key) {
    style ??= CFormUtils.checkIfDarkModeEnabled(context)
        ? style ?? CFormStyle.singleSectionFormDefaultDarkStyle
        : CFormStyle.singleSectionFormDefaultStyle;
    sections = [
      CFormSection(
        style: style,
        sectionTitle: null,
        fields: fields,
      )
    ];
    CForm.multiSection(
      context,
      style: style,
      sections: sections,
    );
  }

  CForm.multiSection(BuildContext context,
      {Key? key, this.style, required this.sections})
      : super(key: key) {
    style ??= CFormUtils.checkIfDarkModeEnabled(context)
        ? style ?? CFormStyle.multiSectionFormDefaultDarkStyle
        : CFormStyle.multiSectionFormDefaultStyle;
    for (var element in sections) {
      element.style = style;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sections,
    );
  }

  bool isValid() {
    bool isValid = true;
    for (var section in sections) {
      for (var field in section.fields) {
        if (field is CFormField) {
          bool fieldValidation = (field.child as CFormFieldCallBack).isValid();
          field.model.status = fieldValidation
              ? CFormFieldStatusEnum.success
              : CFormFieldStatusEnum.error;
          isValid = isValid && fieldValidation;
          field.update();
        }
      }
    }
    return isValid;
  }

  Map<String, dynamic> onSubmit() {
    Map<String, dynamic> data = {};
    for (var section in sections) {
      for (var filed in section.fields) {
        if (filed is CFormField) {
          data[filed.model.tag] =
              (filed.child as CFormFieldCallBack).getValue();
        }
      }
    }
    return data;
  }
}
