// ignore_for_file: must_be_immutable

import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_spinner_with_search_multi_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CFormSpinnerWithSearchMultiField extends StatefulWidget
    implements CFormFieldCallBack {
  final hintIndex = -1;

  CFormSpinnerWithSearchMultiModel model;
  CFormStyle formStyle;
  // SpinnerDataModel? returnedData;
  // SpinnerDataModel? defaultValue;

  List<SpinnerDataModel> valueObject = [];
  List<int> selectedItems = [];

  CFormSpinnerWithSearchMultiField(this.model, this.formStyle, {Key? key})
      : super(key: key);

  @override
  State<CFormSpinnerWithSearchMultiField> createState() =>
      _CFormSpinnerWithSearchMultiFieldState();

  @override
  getValue() {
    return valueObject;
  }

  @override
  bool isValid() {
    if (!(model.required ?? false)) {
      return true;
    } else {
      if (model.maximumChoiceCount != null) {
        return valueObject.length <= model.maximumChoiceCount!;
      } else {
        return valueObject.isNotEmpty;
      }
    }
  }
}

class _CFormSpinnerWithSearchMultiFieldState
    extends State<CFormSpinnerWithSearchMultiField> {
  @override
  void initState() {
    for (var element in widget.model.items) {
      if (element.isSelected) {
        widget.selectedItems.add(element.id);
        widget.valueObject.add(element);
      }
    }
    // TODO - Cas du hint.
    // if (widget.model.hint != null &&
    //     widget.model.hint!.isNotEmpty &&
    //     widget.hintIndex != widget.model.items[0].id) {
    //   widget.model.items.insert(
    //     0,
    //     SpinnerDataModel(
    //         name: widget.model.hint!,
    //         id: widget.hintIndex,
    //         data: null,
    //         isSelected: false),
    //   );
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<SpinnerDataModel>.multiSelection(
            compareFn: (item1, item2) => item1.id == item2.id,
            // TODO - filter fonction if offline
            enabled: widget.model.status != CFormFieldStatusEnum.disabled,
            clearButtonProps: ClearButtonProps(
              isVisible: widget.model.required != true,
              icon: const Icon(CupertinoIcons.clear_circled_solid),
            ),
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
              showSearchBox: true,
              isFilterOnline: widget.model.isFilterOnline,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 8),
                  hintText: widget.model.searchHint,
                  // prefixIcon: widget.model.searchIcon ??
                  //     const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
              ),
              // disabledItemFn: (SpinnerDataModel s) => s.name.startsWith('I'),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: widget.formStyle.fieldTextStyle,
              dropdownSearchDecoration: InputDecoration(
                // labelText: "Menu mode",
                hintText:
                    widget.model.hint != null && widget.model.hint!.isNotEmpty
                        ? widget.model.hint
                        : null,
                hintStyle: widget.formStyle.fieldHintStyle,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
              ),
            ),
            selectedItems: widget.valueObject,
            items: widget.model.items,
            asyncItems: widget.model.asyncItems,
            onChanged: (value) {
              // if (value?.id != widget.hintIndex) {
              setState(() {
                widget.valueObject = value;
                widget.selectedItems = value.map((e) => e.id).toList();
              });
              // }
            },
          ),
        ),
      ],
    );
  }
}
