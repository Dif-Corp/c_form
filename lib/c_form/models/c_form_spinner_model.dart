import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';

class CFormSpinnerModel extends CFormFieldModel {
  List<SpinnerDataModel> items;
  String? hint;

  CFormSpinnerModel(
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
      onTap,
      showTitle,
      required this.items,
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
          showTitle: showTitle,
        );
}
