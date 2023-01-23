import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_colors.dart';
import 'package:c_form/c_form/c_form_theme.dart';

class CFormStyle {
  TextStyle titleTextStyle;
  TextStyle fieldHintStyle;
  TextStyle fieldTextStyle;
  TextStyle errorTextStyle;
  TextStyle helpTextStyle;
  TextStyle sectionTitleStyle;
  Color backgroundFieldColor;
  Color backgroundFieldColorDisable;
  Color backgroundSectionColor;
  Color fieldBorderColor;

  double fieldRadius;
  double sectionRadius;
  double sectionCardElevation;
  double sectionCardPadding;
  String requiredText;

  CFormStyle({
    TextStyle? titleStyle,
    Color? backgroundFieldColor,
    Color? backgroundSectionColor,
    Color? fieldBorderColor,
    Color? backgroundFieldColorDisable,
    double? fieldRadius,
    double? sectionRadius,
    double? sectionCardElevation,
    double? sectionCardPadding,
    TextStyle? fieldHintStyle,
    TextStyle? fieldTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? helpTextStyle,
    String? requiredText,
    TextStyle? sectionTitleStyle,
  })  : backgroundSectionColor = backgroundSectionColor ?? CFormColors.white,
        backgroundFieldColor =
            backgroundFieldColor ?? CFormColors.colorBackground,
        backgroundFieldColorDisable =
            backgroundFieldColorDisable ?? CFormColors.colorBackgroundDisable,
        titleTextStyle = titleStyle ?? CFormTheme.textThemeStyle.displayMedium!,
        fieldRadius = fieldRadius ?? 10.0,
        sectionRadius = sectionRadius ?? 4.0,
        sectionCardElevation = sectionCardElevation ?? 2.0,
        sectionCardPadding = sectionCardPadding ?? 2.0,
        requiredText = requiredText ?? '',
        fieldHintStyle =
            fieldHintStyle ?? CFormTheme.textThemeStyle.displayMedium!,
        fieldTextStyle =
            fieldTextStyle ?? CFormTheme.textThemeStyle.displayMedium!,
        errorTextStyle =
            errorTextStyle ?? CFormTheme.textThemeStyle.headlineSmall!,
        helpTextStyle =
            helpTextStyle ?? CFormTheme.textThemeStyle.headlineMedium!,
        sectionTitleStyle =
            sectionTitleStyle ?? CFormTheme.textThemeStyle.displayLarge!,
        fieldBorderColor = fieldBorderColor ?? CFormColors.white;

  static CFormStyle singleSectionFormDefaultStyle = CFormStyle(
    backgroundFieldColor: CFormColors.white,
    sectionCardElevation: 0.0,
    backgroundSectionColor: Colors.transparent,
    sectionCardPadding: 0.0,
    titleStyle: CFormTheme.textThemeStyle.displayMedium,
    fieldTextStyle: CFormTheme.textThemeStyle.displayMedium,
    fieldHintStyle: CFormTheme.textThemeStyle.displaySmall,
    errorTextStyle: CFormTheme.textThemeStyle.headlineSmall,
    helpTextStyle: CFormTheme.textThemeStyle.headlineMedium,
    sectionTitleStyle: CFormTheme.textThemeStyle.displayLarge,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
    //
    requiredText: "*",
  );

  static CFormStyle singleSectionFormDefaultDarkStyle = CFormStyle(
    backgroundFieldColor: CFormColors.black,
    sectionCardElevation: 0.0,
    backgroundSectionColor: Colors.transparent,
    sectionCardPadding: 0.0,
    sectionTitleStyle: CFormTheme.textThemeDarkStyle.displayLarge,
    titleStyle: CFormTheme.textThemeDarkStyle.displayMedium,
    fieldTextStyle: CFormTheme.textThemeDarkStyle.displayMedium,
    fieldHintStyle: CFormTheme.textThemeDarkStyle.displaySmall,
    errorTextStyle: CFormTheme.textThemeDarkStyle.headlineSmall,
    helpTextStyle: CFormTheme.textThemeDarkStyle.headlineMedium,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
    //
    requiredText: "*",
  );

  static CFormStyle multiSectionFormDefaultStyle = CFormStyle(
    backgroundFieldColor: CFormColors.colorBackground,
    sectionCardElevation: 2.0,
    backgroundSectionColor: CFormColors.white,
    sectionCardPadding: 8.0,
    titleStyle: CFormTheme.textThemeStyle.displayMedium,
    fieldTextStyle: CFormTheme.textThemeStyle.displayMedium,
    fieldHintStyle: CFormTheme.textThemeStyle.displaySmall,
    errorTextStyle: CFormTheme.textThemeStyle.headlineSmall,
    helpTextStyle: CFormTheme.textThemeStyle.headlineMedium,
    sectionTitleStyle: CFormTheme.textThemeStyle.displayLarge,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
    //
    requiredText: "*",
  );

  static CFormStyle multiSectionFormDefaultDarkStyle = CFormStyle(
    backgroundFieldColor: CFormColors.colorBackgroundDark,
    backgroundSectionColor: CFormColors.black,
    titleStyle: CFormTheme.textThemeDarkStyle.displayMedium,
    fieldTextStyle: CFormTheme.textThemeDarkStyle.displayMedium,
    fieldHintStyle: CFormTheme.textThemeDarkStyle.displaySmall,
    errorTextStyle: CFormTheme.textThemeDarkStyle.headlineSmall,
    helpTextStyle: CFormTheme.textThemeDarkStyle.headlineMedium,
    sectionTitleStyle: CFormTheme.textThemeDarkStyle.displayLarge,
    sectionRadius: 8,
    sectionCardElevation: 2.0,
    sectionCardPadding: 8.0,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
    //
    requiredText: "*",
  );
}
