// ignore_for_file: must_be_immutable

import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_spinner_with_search_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CFormSpinnerWithSearchField extends StatefulWidget
    implements CFormFieldCallBack {
  final hintIndex = -1;

  CFormSpinnerWithSearchModel model;
  CFormStyle formStyle;
  SpinnerDataModel? returnedData;
  SpinnerDataModel? defaultValue; // REVIEW -

  CFormSpinnerWithSearchField(this.model, this.formStyle, {Key? key})
      : super(key: key);

  @override
  State<CFormSpinnerWithSearchField> createState() =>
      _CFormSpinnerWithSearchFieldState();

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

class _CFormSpinnerWithSearchFieldState
    extends State<CFormSpinnerWithSearchField> {
  DropDownDecoratorProps? dropdownDecoratorProps;

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

    dropdownDecoratorProps = _getDropDownDecoratorProps();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<SpinnerDataModel>(
            compareFn: (item1, item2) => item1.name == item2.name,
            enabled: widget.model.status != CFormFieldStatusEnum.disabled,
            clearButtonProps: ClearButtonProps(
              isVisible: widget.model.required != true,
              icon: const Icon(CupertinoIcons.clear_circled_solid),
            ),
            popupProps: PopupProps.menu(
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
              interceptCallBacks: false,
              itemBuilder: (context, item, isSelected) => ListTile(
                // enabled: !_isDisabled(item),
                leading: item.leading,
                title: Text(item.name),
                selected: item.isSelected,
                // onTap: _isDisabled(item) ? null : () => _handleSelectedItem(item), // NOTE - Sera gérépar le drop....
              ),
            ),
            dropdownDecoratorProps:
                dropdownDecoratorProps ?? _getDropDownDecoratorProps(),
            // isExpanded: true,
            selectedItem: widget.returnedData ??
                (widget.model.items.isNotEmpty
                    ? widget.model.items.first
                    : null), // REVIEW - Utiliser firstOrNull
            items: widget.model.items,
            asyncItems: widget.model.asyncItems,
            onChanged: (value) {
              if (value?.id != widget.hintIndex) {
                setState(() {
                  widget.returnedData = value;
                });
              }
            },
            //
            dropdownBuilder: (context, selectedItem) => Row(
              children: [
                if (selectedItem?.leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: selectedItem!.leading!,
                  ),
                Flexible(
                  child: Text(
                    selectedItem?.name ?? '',
                    style: selectedItem?.id == widget.hintIndex
                        ? widget.formStyle.fieldHintStyle
                        : widget.formStyle.fieldTextStyle,
                    // style: dropdownDecoratorProps?.baseStyle,
                    textAlign: dropdownDecoratorProps?.textAlign,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DropDownDecoratorProps _getDropDownDecoratorProps() {
    return DropDownDecoratorProps(
      baseStyle: widget.formStyle.fieldTextStyle,
      dropdownSearchDecoration: InputDecoration(
        // labelText: "Menu mode",
        hintText: widget.model.hint != null && widget.model.hint!.isNotEmpty
            ? widget.model.hint
            : null,
        hintStyle: widget.formStyle.fieldHintStyle,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
      ),
    );
  }
}
