import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/c_form_utils.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_bank_card_filed_model.dart';

class CFormBankCardField extends StatelessWidget implements CFormFieldCallBack {
  final CFormBankCardModel model;
  final TextEditingController? controller = TextEditingController();
  final CFormStyle formStyle;

  CFormBankCardField(this.model, this.formStyle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextField(
        inputFormatters: [CardNumberFormatter()],
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        controller: controller,
        maxLines: 1,
        style: formStyle.fieldTextStyle,
        keyboardType: TextInputType.number,
        focusNode: model.focusNode,
        textInputAction: model.nextFocusNode != null
            ? TextInputAction.next
            : TextInputAction.done,
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(model.nextFocusNode);
        },
        decoration: InputDecoration(
          hintText: model.hint ?? '- - - -   - - - -   - - - -   - - - -',
          counterText: '',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: formStyle.fieldHintStyle,
        ),
      ),
    );
  }

  @override
  getValue() {
    return controller!.text.replaceAll(' ', '');
  }

  @override
  bool isValid() {
    if (model.validateRegEx == null) {
      if (!(model.required ?? false)) {
        return true;
      } else {
        return controller!.text.replaceAll(' ', '').length == 16;
      }
    } else {
      return model.validateRegEx!.hasMatch(controller!.text);
    }
  }
}
