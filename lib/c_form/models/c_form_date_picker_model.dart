import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/date_data_model.dart';

class CFormDatePickerModel extends CFormFieldModel {
  String? hint;
  CFormDateFormatType? dateFormatType;
  bool? isPastAvailable;
  CFormDate? initialDate;
  CFormDate? availableFrom;
  CFormDate? availableTo;
  CFormCalendarType calendarType;

  CFormDatePickerModel({
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
    weight,
    showTitle,
    this.hint,
    this.dateFormatType,
    this.isPastAvailable,
    this.availableFrom,
    this.availableTo,
    this.initialDate,
    required this.calendarType,
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
            weight: weight,
            showTitle: showTitle);
}
