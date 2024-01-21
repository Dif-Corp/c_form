import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';

class CFormSpinnerWithSearchModel extends CFormFieldModel {
  List<SpinnerDataModel> items;
  Future<List<SpinnerDataModel>> Function(String)? asyncItems;
  String? hint;
  bool isFilterOnline;
  String? searchHint;

  CFormSpinnerWithSearchModel({
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
    validateRegEx,
    weight,
    onTap,
    showTitle,
    this.items = const [],
    this.asyncItems,
    this.hint,
    required this.isFilterOnline,
    this.searchHint,
  }) :
        // assert(items !=null || asyncItems!=null),
        super(
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
