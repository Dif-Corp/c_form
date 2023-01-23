import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/data_model/date_data_model.dart';

class CFormDateRangePickerModel extends CFormFieldModel {
  String? hint;
  CFormDateFormatType? dateFormatType;
  bool? isPastAvailable;
  CFormDate? initialStartDate;
  CFormDate? initialEndDate;
  CFormDate? availableFrom;
  CFormDate? availableTo;
  CFormCalendarType calendarType;
  String? from;
  String? to;

  CFormDateRangePickerModel({
    type,
    tag,
    title,
    errorMessage,
    helpMessage,
    showTitle,
    prefixWidget,
    postfixWidget,
    required,
    status,
    value,
    validateReg,
    weight,
    this.hint,
    this.dateFormatType,
    this.isPastAvailable,
    this.availableFrom,
    this.availableTo,
    this.initialStartDate,
    this.initialEndDate,
    required this.calendarType,
    this.from,
    this.to,
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
            showTitle: showTitle);
}
