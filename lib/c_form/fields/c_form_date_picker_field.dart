// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_date_picker_model.dart';
import 'package:c_form/c_form/models/data_model/date_data_model.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
// import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CFormDatePickerField extends StatefulWidget
    implements CFormFieldCallBack {
  late CFormDatePickerModel model;
  final CFormStyle formStyle;

  String selectedDateText = '';
  Jalali? selectedJalaliDate;
  DateTime? selectedGregorianDate;
  late BuildContext context;

  late Jalali jalaliInitialDate;
  late Jalali jalaliAvailableFrom;
  late Jalali jalaliAvailableTo;

  late DateTime gregorianInitialDate;
  late DateTime gregorianAvailableFrom;
  late DateTime gregorianAvailableTo;

  bool isDateSelected = false;

  CFormDatePickerField(this.model, this.formStyle, {Key? key})
      : super(key: key);

  @override
  State<CFormDatePickerField> createState() => _CFormDatePickerFieldState();

  @override
  getValue() {
    return _getData();
  }

  @override
  bool isValid() {
    if (!(model.required ?? false)) {
      return true;
    } else {
      if (model.calendarType == CFormCalendarType.jalali) {
        return selectedJalaliDate != null;
      } else {
        return selectedGregorianDate != null;
      }
    }
  }

  _getData() {
    if (model.calendarType == CFormCalendarType.jalali) {
      return selectedJalaliDate == null
          ? null
          : DateDataModel(
              dateServerType: selectedJalaliDate!.toDateTime(),
              timeStamp:
                  selectedJalaliDate!.toDateTime().millisecondsSinceEpoch,
              showDateStr: selectedDateText);
    } else {
      return selectedGregorianDate == null
          ? null
          : DateDataModel(
              dateServerType: selectedGregorianDate!,
              timeStamp: selectedGregorianDate!.millisecondsSinceEpoch,
              showDateStr: selectedDateText);
    }
  }
}

class _CFormDatePickerFieldState extends State<CFormDatePickerField> {
  @override
  void initState() {
    _initialDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.context = context;
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, left: 10.0, top: 18, bottom: 18),
      child: InkWell(
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.selectedDateText.isEmpty
                    ? widget.model.hint ?? ''
                    : widget.selectedDateText,
                style: widget.isDateSelected
                    ? widget.formStyle.fieldTextStyle
                    : widget.formStyle.fieldHintStyle,
              ),
            ),
          ],
        ),
        onTap: () {
          if (widget.model.calendarType == CFormCalendarType.jalali) {
            _openDatePicker();
          } else {
            _openGregorianPicker();
          }
        },
      ),
    );
  }

  _initialDates() {
    if (widget.model.calendarType == CFormCalendarType.jalali) {
      _initialJalaliDates();
    } else {
      _initialGregorianDates();
    }
  }

  _initialGregorianDates() {
    if (widget.model.initialDate == null) {
      widget.gregorianInitialDate = DateTime.now();
    } else {
      widget.gregorianInitialDate = DateTime(widget.model.initialDate!.year,
          widget.model.initialDate!.month, widget.model.initialDate!.day);
      widget.selectedGregorianDate = widget.gregorianInitialDate;
      _displayGregorianDate();
    }

    if (widget.model.availableTo == null) {
      widget.gregorianAvailableTo = DateTime(2100, 1, 1);
    } else {
      widget.gregorianAvailableTo = DateTime(widget.model.availableTo!.year,
          widget.model.availableTo!.month, widget.model.availableTo!.day);
    }

    _initialGregorianAvailableFromDate();
  }

  _initialJalaliDates() {
    if (widget.model.initialDate == null) {
      widget.jalaliInitialDate = Jalali.now();
    } else {
      widget.jalaliInitialDate = Jalali(widget.model.initialDate!.year,
          widget.model.initialDate!.month, widget.model.initialDate!.day);
      widget.selectedJalaliDate = widget.jalaliInitialDate;
      _displayDate();
    }

    if (widget.model.availableTo == null) {
      widget.jalaliAvailableTo = Jalali.MAX;
    } else {
      widget.jalaliAvailableTo = Jalali(widget.model.availableTo!.year,
          widget.model.availableTo!.month, widget.model.availableTo!.day);
    }

    _initialJalaliAvailableFromDate();
  }

  _initialGregorianAvailableFromDate() {
    if (widget.model.isPastAvailable ?? false) {
      if (widget.model.availableFrom != null) {
        widget.gregorianAvailableFrom = DateTime(
            widget.model.availableFrom!.year,
            widget.model.availableFrom!.month,
            widget.model.availableFrom!.day);
      } else {
        widget.gregorianAvailableFrom = DateTime(1700, 1, 1);
      }
    } else {
      widget.gregorianAvailableFrom = widget.gregorianInitialDate;
    }
  }

  _initialJalaliAvailableFromDate() {
    if (widget.model.isPastAvailable ?? false) {
      if (widget.model.availableFrom != null) {
        widget.jalaliAvailableFrom = Jalali(widget.model.availableFrom!.year,
            widget.model.availableFrom!.month, widget.model.availableFrom!.day);
      } else {
        widget.jalaliAvailableFrom = Jalali.MIN;
      }
    } else {
      widget.jalaliAvailableFrom = widget.jalaliInitialDate;
    }
  }

  _openDatePicker() async {
    Jalali? picked = await showPersianDatePicker(
      context: widget.context,
      initialDate: widget.jalaliInitialDate,
      firstDate: widget.jalaliAvailableFrom,
      lastDate: widget.jalaliAvailableTo,
    );
    if (picked != null) {
      widget.selectedJalaliDate = picked;
      widget.jalaliInitialDate = picked;
      widget.isDateSelected = true;
      _displayDate();
      update();
    } else {
      widget.isDateSelected = false;
    }
  }

  _openGregorianPicker() async {
    DateTime? picked = await showDatePicker(
      context: widget.context,
      initialDate: widget.gregorianInitialDate,
      firstDate: widget.gregorianAvailableFrom,
      lastDate: widget.gregorianAvailableTo,
    );
    if (picked != null) {
      widget.selectedGregorianDate = picked;
      widget.isDateSelected = true;
      widget.gregorianInitialDate = picked;
      _displayGregorianDate();
      update();
    } else {
      widget.isDateSelected = false;
    }
  }

  update() {
    if (mounted) {
      setState(() {});
    }
  }

  _displayDate() {
    if (widget.model.dateFormatType != null) {
      switch (widget.model.dateFormatType) {
        case CFormDateFormatType.numeric:
          widget.selectedDateText =
              widget.selectedJalaliDate!.formatCompactDate();
          break;
        case CFormDateFormatType.fullText:
          widget.selectedDateText = widget.selectedJalaliDate!.formatFullDate();
          break;
        case CFormDateFormatType.mediumText:
          widget.selectedDateText =
              widget.selectedJalaliDate!.formatMediumDate();
          break;
        case CFormDateFormatType.shortText:
          widget.selectedDateText =
              widget.selectedJalaliDate!.formatShortDate();
          break;
        default:
          widget.selectedDateText =
              widget.selectedJalaliDate!.formatCompactDate();
          break;
      }
    } else {
      widget.selectedDateText = widget.selectedJalaliDate!.formatCompactDate();
    }
  }

  _displayGregorianDate() {
    if (widget.model.dateFormatType != null) {
      switch (widget.model.dateFormatType) {
        case CFormDateFormatType.numeric:
          widget.selectedDateText =
              DateFormat.yMd().format(widget.selectedGregorianDate!);
          break;
        case CFormDateFormatType.fullText:
          widget.selectedDateText = DateFormat('EEE, MMM d, ' 'yyyy')
              .format(widget.selectedGregorianDate!);
          break;
        case CFormDateFormatType.mediumText:
          widget.selectedDateText =
              DateFormat('EEE, MMM d').format(widget.selectedGregorianDate!);
          break;
        case CFormDateFormatType.shortText:
          widget.selectedDateText = DateFormat('MMM d, ' 'yyyy')
              .format(widget.selectedGregorianDate!);
          break;
        default:
          widget.selectedDateText =
              DateFormat.yMd().format(widget.selectedGregorianDate!);
          break;
      }
    } else {
      widget.selectedDateText =
          DateFormat.yMd().format(widget.selectedGregorianDate!);
    }
  }
}
