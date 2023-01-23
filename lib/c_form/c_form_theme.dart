import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_colors.dart';

class CFormTheme {
  /// Les fontSize géré par CFormTheme son multitpliépar ce nombre
  static double fontScale = 1.0;

  static TextTheme textThemeStyle = TextTheme(
    displayLarge: TextStyle(
      color: CFormColors.textColorHeader,
      fontWeight: FontWeight.w700,
      // fontSize: 12.0,
      fontSize: 16.0 * CFormTheme.fontScale,
    ),
    displayMedium: TextStyle(
      color: CFormColors.textColor,
      fontWeight: FontWeight.w700,
      // fontSize: 11.0,
      fontSize: 15.0 * CFormTheme.fontScale,
    ),
    displaySmall: TextStyle(
      color: CFormColors.hintTextColor,
      fontWeight: FontWeight.w500,
      // fontSize: 9.0,
      fontSize: 14.0 * CFormTheme.fontScale,
    ),
    headlineMedium: TextStyle(
      color: CFormColors.hintTextColor,
      fontWeight: FontWeight.w400,
      // fontSize: 7.0,
      fontSize: 13.0 * CFormTheme.fontScale,
    ),
    headlineSmall: TextStyle(
      color: CFormColors.red,
      fontWeight: FontWeight.w400,
      // fontSize: 7.0,
      fontSize: 13.0 * CFormTheme.fontScale,
    ),
  );

  static TextTheme textThemeDarkStyle = TextTheme(
    displayLarge: TextStyle(
      color: CFormColors.textDarkColorHeader,
      fontWeight: FontWeight.w700,
      fontSize: 16.0 * CFormTheme.fontScale,
    ),
    displayMedium: TextStyle(
      color: CFormColors.textColorDark,
      fontWeight: FontWeight.w700,
      fontSize: 15.0 * CFormTheme.fontScale,
    ),
    displaySmall: TextStyle(
      color: CFormColors.textColorDark,
      fontWeight: FontWeight.w500,
      fontSize: 14.0 * CFormTheme.fontScale,
    ),
    headlineMedium: TextStyle(
      // color: CFormColors.hintTextDarkColor,
      color: Color(0xFFB4B4B4),
      fontWeight: FontWeight.w400,
      fontSize: 13.0 * CFormTheme.fontScale,
    ),
    headlineSmall: TextStyle(
      color: CFormColors.red,
      fontWeight: FontWeight.w400,
      fontSize: 13.0 * CFormTheme.fontScale,
    ),
  );
}
