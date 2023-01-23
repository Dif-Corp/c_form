// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_time_picker_model.dart';
import 'package:c_form/c_form/models/data_model/time_data_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CFormTimePickerField extends StatefulWidget
    implements CFormFieldCallBack {
  late CFormTimePickerModel model;
  CFormStyle formStyle;

  String? selectedTimeText;

  bool isTimeSelected = false;
  TimeOfDay? selectedTime;
  late BuildContext context;

  CFormTimePickerField(this.model, this.formStyle, {Key? key})
      : super(key: key) {
    selectedTimeText = model.hint ?? "Choisissez l'heure";
  }

  @override
  State<CFormTimePickerField> createState() => _CFormTimePickerFieldState();

  @override
  getValue() {
    return _provideData(context);
  }

  @override
  bool isValid() {
    if (!(model.required ?? false)) {
      return true;
    } else {
      if (selectedTime == null) {
        return false;
      } else {
        return true;
      }
    }
  }

  _provideData(BuildContext context) {
    return selectedTime == null
        ? null
        : TimeDataModel(
            displayTime: selectedTime!.format(context),
            hour: selectedTime!.hour,
            minute: selectedTime!.minute);
  }
}

class _CFormTimePickerFieldState extends State<CFormTimePickerField> {
  @override
  void initState() {
    super.initState();
    if (widget.model.initialTime != null) {
      widget.selectedTime = widget.model.initialTime;
      _displayTime(widget.selectedTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.context = context;
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, left: 10.0, top: 16, bottom: 16),
      child: InkWell(
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.selectedTimeText!,
                style: widget.isTimeSelected
                    ? widget.formStyle.fieldTextStyle
                    : widget.formStyle.fieldHintStyle,
              ),
            ),
          ],
        ),
        onTap: () {
          _openTimePicker();
        },
      ),
    );
  }

  _openTimePicker() async {
    var picked = await showPersianTimePicker(
      context: widget.context,
      initialTime: widget.model.initialTime ?? TimeOfDay.now(),
      initialEntryMode: PTimePickerEntryMode.dial,
      useRootNavigator: false,
    );
    if (picked != null) {
      widget.selectedTime = picked;
      widget.model.initialTime = picked;
      widget.isTimeSelected = true;
      _displayTime(picked);
      update();
    } else {
      widget.isTimeSelected = false;
    }
  }

  update() {
    if (mounted) {
      setState(() {});
    }
  }

  _displayTime(TimeOfDay time) {
    String hour = time.hour.toString().length == 1
        ? '0${time.hour}'
        : time.hour.toString();
    String minute = time.minute.toString().length == 1
        ? '0${time.minute}'
        : time.minute.toString();
    widget.selectedTimeText = '$hour:$minute';
  }
}
