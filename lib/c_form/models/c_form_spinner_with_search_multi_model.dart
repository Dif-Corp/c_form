import 'package:c_form/c_form/models/c_form_spinner_with_search_model.dart';

class CFormSpinnerWithSearchMultiModel extends CFormSpinnerWithSearchModel {
  // List<SpinnerDataModel> items;
  // Future<List<SpinnerDataModel>> Function(String)? asyncItems;
  // String? hint;
  // bool isFilterOnline;
  // String? searchHint;
  /// Ne doit pas etre < ou = à 0
  int? maximumChoiceCount;

  CFormSpinnerWithSearchMultiModel({
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
    //
    items = const [],
    asyncItems,
    hint,
    required isFilterOnline,
    searchHint,
    //
    this.maximumChoiceCount,
  })  :
        // assert(items !=null || asyncItems!=null),
        assert((maximumChoiceCount == null || maximumChoiceCount > 0)),
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
          value: value,
          validateRegEx: validateRegEx,
          weight: weight,
          showTitle: showTitle,
          //
          items: items,
          asyncItems: asyncItems,
          hint: hint,
          isFilterOnline: isFilterOnline,
          searchHint: searchHint,
        );
}
