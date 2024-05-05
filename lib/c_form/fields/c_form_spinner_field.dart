// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_spinner_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';

class CFormSpinnerField extends StatefulWidget implements CFormFieldCallBack {
  final hintIndex = -1;

  CFormSpinnerModel model;
  CFormStyle formStyle;
  SpinnerDataModel? returnedData;
  SpinnerDataModel? defaultValue; // REVIEW -

  CFormSpinnerField(this.model, this.formStyle, {Key? key}) : super(key: key);

  @override
  State<CFormSpinnerField> createState() => _CFormSpinnerFieldState();

  @override
  getValue() {
    return returnedData;
  }

  @override
  bool isValid() {
    if (model.required != null && model.required!) {
      if (returnedData?.id == -1 || returnedData == null) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}

class _CFormSpinnerFieldState extends State<CFormSpinnerField> {
  @override
  void initState() {
    for (var element in widget.model.items) {
      if (element.isSelected) {
        widget.returnedData = element;
        return;
      }
    }
    if (widget.model.hint != null &&
        widget.model.hint!.isNotEmpty &&
        widget.hintIndex != widget.model.items[0].id &&
        widget.returnedData == null) {
      widget.model.items.insert(
        0,
        SpinnerDataModel(
            name: widget.model.hint!,
            id: widget.hintIndex,
            data: null,
            isSelected: false),
      );
      widget.returnedData = widget.model.items.first;
    }

    if (widget.returnedData == null && widget.model.items.isNotEmpty) {
      widget.returnedData = widget.model.items.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<SpinnerDataModel>(
            underline: const SizedBox(),
            iconSize: 0,
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              ),
            ),
            isExpanded: true,
            value: widget.returnedData ?? widget.model.items[0],
            items: widget.model.items
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: Row(
                        children: [
                          if (widget.returnedData?.leading != null)
                            widget.returnedData!.leading!,
                          Flexible(
                            child: Text(
                              e.name,
                              style: e.id == widget.hintIndex
                                  ? widget.formStyle.fieldHintStyle
                                  : widget.formStyle.fieldTextStyle,
                            ),
                          ),
                        ],
                      ),
                    )))
                .toList(),
            onChanged: (value) {
              if (value?.id != widget.hintIndex) {
                widget.returnedData = value;
                setState(() => {});
              }
            },
          ),
        ),
      ],
    );
  }
}
