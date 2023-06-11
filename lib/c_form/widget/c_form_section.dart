import 'package:c_form/c_form/widget/c_form_field.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/c_form_theme.dart';
import 'package:c_form/c_form/fields/c_form_text_plain_field.dart';

// ignore: must_be_immutable
class CFormSection extends StatelessWidget {
  late List<Widget> fields;
  CFormStyle? style;
  String? sectionTitle;

  CFormSection(
      {Key? key, required this.fields, this.style, required this.sectionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    style = style ?? CFormStyle();

    List<Row> rows = [];

    int i = 0; // while index on fields
    int weightSum = 0;

    while (i < fields.length) {
      if (fields[i] is CFormField) {
        List<Widget> childrenAtRow = []; // children in each row
        while (weightSum < 12 && i <= fields.length - 1) {
          CFormField field = fields[i] as CFormField;
          childrenAtRow.add(
            Expanded(
              flex: field.model.weight ?? 12,
              child: field,
            ),
          );

          weightSum += field.model.weight ?? 12;
          if (i < fields.length - 1 &&
              fields[i + 1] is CFormField &&
              fields[i + 1] is! CFormTextPlainField) {
            field.model.nextFocusNode =
                (fields[i + 1] as CFormField).model.focusNode;
          }
          field.formStyle = style!;
          i++;

          // Cette condition est pour l'espacement entre les widgets afin qu'elle ne soit pas appliquée au premier widget
          if (weightSum != 12) {
            childrenAtRow.add(const SizedBox(
              width: 12,
            ));
          }
        }
        rows.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: childrenAtRow));
        weightSum = 0;
      } else {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.end, //
            children: [
              Expanded(
                flex: 12,
                child: fields[i],
              )
            ],
          ),
        );
        i++;
      }
    }

    return Column(
      children: [
        sectionTitle != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            sectionTitle!,
                            style: style?.sectionTitleStyle ??
                                CFormTheme.textThemeStyle.displayLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                  ],
                ),
              )
            : Container(),
        Card(
          color: style?.backgroundSectionColor,
          elevation: style?.sectionCardElevation,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: style!.sectionRadius,
              cornerSmoothing: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: style!.sectionCardPadding,
                right: style!.sectionCardPadding,
                top: style!.sectionCardPadding,
                bottom: style!.sectionCardPadding),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  return rows[index];
                }),
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
