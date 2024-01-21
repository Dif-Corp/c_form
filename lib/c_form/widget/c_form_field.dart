import 'package:c_form/c_form/fields/c_form_multi_image_picker_field.dart';
import 'package:c_form/c_form/fields/c_form_spinner_with_search_field.dart';
import 'package:c_form/c_form/fields/c_form_spinner_with_search_multi_field.dart';
import 'package:c_form/c_form/models/c_form_multi_image_picker_model.dart';
import 'package:c_form/c_form/models/c_form_spinner_with_search_model.dart';
import 'package:c_form/c_form/models/c_form_spinner_with_search_multi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:c_form/c_form/c_form_colors.dart';
import 'package:c_form/c_form/c_form_theme.dart';
import 'package:c_form/c_form/enums/required_check_list_enum.dart';
import 'package:c_form/c_form/fields/c_form_bank_card_field.dart';
import 'package:c_form/c_form/fields/c_form_check_list_field.dart';
import 'package:c_form/c_form/fields/c_form_date_picker_field.dart';
import 'package:c_form/c_form/fields/c_form_date_range_picker_field.dart';
import 'package:c_form/c_form/fields/c_form_email_field.dart';
import 'package:c_form/c_form/fields/c_form_image_picker_field.dart';
import 'package:c_form/c_form/fields/c_form_mobile_field.dart';
import 'package:c_form/c_form/fields/c_form_number_field.dart';
import 'package:c_form/c_form/fields/c_form_password_field.dart';
import 'package:c_form/c_form/fields/c_form_price_field.dart';
import 'package:c_form/c_form/fields/c_form_qr_scanner_field.dart';
import 'package:c_form/c_form/fields/c_form_radio_group_field.dart';
import 'package:c_form/c_form/fields/c_form_spinner_field.dart';
import 'package:c_form/c_form/fields/c_form_text_field.dart';
import 'package:c_form/c_form/fields/c_form_text_plain_field.dart';
import 'package:c_form/c_form/fields/c_form_time_picker_field.dart';
import 'package:c_form/c_form/models/c_form_bank_card_filed_model.dart';
import 'package:c_form/c_form/models/c_form_checkbox_model.dart';
import 'package:c_form/c_form/models/c_form_date_picker_model.dart';
import 'package:c_form/c_form/models/c_form_date_range_picker_model.dart';
import 'package:c_form/c_form/models/c_form_email_model.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_field_type_enum.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/c_form_utils.dart';
import 'package:c_form/c_form/models/c_form_image_picker_model.dart';
import 'package:c_form/c_form/models/c_form_mobile_model.dart';
import 'package:c_form/c_form/models/c_form_number_model.dart';
import 'package:c_form/c_form/models/c_form_price_model.dart';
import 'package:c_form/c_form/models/c_form_qr_scanner_model.dart';
import 'package:c_form/c_form/models/c_form_radio_model.dart';
import 'package:c_form/c_form/models/c_form_spinner_model.dart';
import 'package:c_form/c_form/models/c_form_text_model.dart';
import 'package:c_form/c_form/models/c_form_text_password_model.dart';
import 'package:c_form/c_form/models/c_form_text_plain_model.dart';
import 'package:c_form/c_form/models/c_form_time_picker_model.dart';
import 'package:c_form/c_form/models/data_model/check_data_model.dart';
import 'package:c_form/c_form/models/data_model/date_data_model.dart';
import 'package:c_form/c_form/models/data_model/radio_data_model.dart';
import 'package:c_form/c_form/models/data_model/spinner_data_model.dart';

// ignore: must_be_immutable
class CFormField<T> extends StatefulWidget {
  late CFormFieldModel model;
  Widget? child;
  CFormStyle? formStyle;

  VoidCallback? onUpdate;

  Type typeOfT() => T;

  update() {
    onUpdate!.call();
  }

  //<editor-fold desc="Component Constructors">

  CFormField.qrScanner({
    Key? key,
    required String tag,
    String? title,
    bool? showTitle,
    String? errorMessage,
    String? helpMessage,
    bool? required,
    CFormFieldStatusEnum? status,
    int? weight,
    String? hint,
    Widget? iconWidget,
    Color? iconColor,
  }) : super(key: key) {
    model = CFormQRScannerModel(
      type: CFormFieldTypeEnum.qrScanner,
      tag: tag,
      showTitle: showTitle ?? false,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      required: required,
      status: status,
      weight: weight,
      hint: hint,
      iconWidget: iconWidget,
    );
  }

  CFormField.imagePicker({
    Key? key,
    required String tag,
    required Widget iconWidget,
    String? defaultImagePathValue,
    String? title,
    String? errorMessage,
    String? helpMessage,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    int? weight,
    String? hint,
    String? cameraPopupTitle,
    String? galleryPopupTitle,
    String? cameraPopupIcon,
    String? galleryPopupIcon,
    CFormImageSource? imageSource,
    Color? iconColor,
    bool? showCropper,
    double? maximumSizePerImageInBytes,
    VoidCallback? onErrorSizeItem,
  }) : super(key: key) {
    model = CFormImagePickerModel(
      type: CFormFieldTypeEnum.imagePicker,
      tag: tag,
      showCropper: showCropper ?? true,
      imageSource: imageSource ?? CFormImageSource.both,
      showTitle: showTitle ?? false,
      title: title,
      cameraPopupTitle: cameraPopupTitle,
      galleryPopupTitle: galleryPopupTitle,
      cameraPopupIcon: cameraPopupIcon,
      galleryPopupIcon: galleryPopupIcon,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      required: required,
      status: status,
      weight: weight,
      hint: hint,
      iconWidget: iconWidget,
      defaultValue: defaultImagePathValue,
      maximumSizePerImageInBytes: maximumSizePerImageInBytes,
      onErrorSizeItem: onErrorSizeItem,
    );
  }

  CFormField.multiImagePicker({
    Key? key,
    required String tag,
    required Widget iconWidget,
    List<String>? defaultImagePathValues,
    String? title,
    String? errorMessage,
    String? helpMessage,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    int? weight,
    String? hint,
    String? cameraPopupTitle,
    String? galleryPopupTitle,
    String? cameraPopupIcon,
    String? galleryPopupIcon,
    CFormImageSource? imageSource,
    Color? iconColor,
    bool? showCropper,
    double? maximumSizePerImageInKB,
    double? maximumImageCount,
    VoidCallback? onErrorSizeItem,
  }) : super(key: key) {
    model = CFormMultiImagePickerModel(
      type: CFormFieldTypeEnum.multiImagePicker,
      tag: tag,
      showCropper: showCropper ?? true,
      imageSource: imageSource ?? CFormImageSource.both,
      showTitle: showTitle ?? false,
      title: title,
      cameraPopupTitle: cameraPopupTitle,
      galleryPopupTitle: galleryPopupTitle,
      cameraPopupIcon: cameraPopupIcon,
      galleryPopupIcon: galleryPopupIcon,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      required: required,
      status: status,
      weight: weight,
      hint: hint,
      iconWidget: iconWidget,
      defaultImagePath: defaultImagePathValues,
      maximumImageCount: maximumImageCount,
      maximumSizePerImageInKB: maximumSizePerImageInKB,
      onErrorSizeItem: onErrorSizeItem,
    );
  }

  CFormField.spinner({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    required List<SpinnerDataModel> items,
    String? hint,
  }) : super(key: key) {
    model = CFormSpinnerModel(
      type: CFormFieldTypeEnum.spinner,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      items: items,
      hint: hint,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.spinnerWithSearch({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    List<SpinnerDataModel> items = const [],
    Future<List<SpinnerDataModel>> Function(String)? asyncItems,
    String? hint,
    bool isFilterOnline =
        true, // TODO - ne peut pas etre true si asyncItems est null???
    String? searchHint,
  }) : super(key: key) {
    model = CFormSpinnerWithSearchModel(
      type: CFormFieldTypeEnum.spinnerWithSearch,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      items: items,
      asyncItems: asyncItems,
      hint: hint,
      validateRegEx: validateRegEx,
      isFilterOnline: isFilterOnline,
      searchHint: searchHint,
    );
  }

  CFormField.spinnerWithSearchMulti({
    Key? key,
    required String tag,
    // RequiredSpinnerWithSearchMultiEnum? requiredCheckListEnum,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    List<SpinnerDataModel> items = const [],
    Future<List<SpinnerDataModel>> Function(String)? asyncItems,
    String? hint,
    bool isFilterOnline =
        true, // TODO - ne peut pas etre true si asyncItems est null???
    String? searchHint,
    int? maximumChoiceCount,
  }) : super(key: key) {
    model = CFormSpinnerWithSearchMultiModel(
      type: CFormFieldTypeEnum.spinnerWithSearchMulti,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      items: items,
      asyncItems: asyncItems,
      hint: hint,
      validateRegEx: validateRegEx,
      isFilterOnline: isFilterOnline,
      searchHint: searchHint,
      maximumChoiceCount: maximumChoiceCount,
    );
  }

  CFormField.radioGroup(
      {Key? key,
      required String tag,
      String? title,
      String? errorMessage,
      String? helpMessage,
      Widget? prefixWidget,
      bool? required,
      bool? showTitle,
      CFormFieldStatusEnum? status,
      String? value,
      int? weight,
      RegExp? validateRegEx,
      String? hint,
      Axis? scrollDirection,
      Widget? selectedIcon,
      Widget? unSelectedIcon,
      bool? scrollable = true,
      double? height = 200.0,
      bool? showScrollBar = true,
      Color? scrollBarColor,
      required bool searchable,
      String? searchHint,
      Icon? searchIcon,
      BoxDecoration? searchBoxDecoration,
      required List<RadioDataModel> items,
      required ValueChanged<RadioDataModel> callBack})
      : super(key: key) {
    model = CFormRadioModel(
      type: CFormFieldTypeEnum.radioGroup,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      required: required,
      status: status,
      value: value,
      weight: weight,
      showScrollBar: showScrollBar,
      scrollBarColor: scrollBarColor,
      hint: hint,
      items: items,
      callBack: callBack,
      scrollDirection: scrollDirection,
      unSelectedIcon: unSelectedIcon,
      selectedIcon: selectedIcon,
      scrollable: scrollable ?? false,
      height: height,
      searchable: searchable,
      searchHint: searchHint,
      searchIcon: searchIcon,
      searchBoxDecoration: searchBoxDecoration,
    );
  }

  CFormField.checkList({
    Key? key,
    required String tag,
    required bool searchable,
    required List<CheckDataModel> items,
    required ValueChanged<CheckDataModel> callBack,
    RequiredCheckListEnum? requiredCheckListEnum,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    String? hint,
    Axis? scrollDirection,
    Widget? selectedIcon,
    Widget? unSelectedIcon,
    bool? scrollable,
    double? height,
    bool? showScrollBar,
    Color? scrollBarColor,
    String? searchHint,
    Icon? searchIcon,
    BoxDecoration? searchBoxDecoration,
  }) : super(key: key) {
    bool isRequired = false;
    if (requiredCheckListEnum != null &&
        requiredCheckListEnum != RequiredCheckListEnum.none) {
      isRequired = true;
    }
    model = CFormCheckBoxModel(
        type: CFormFieldTypeEnum.checkList,
        tag: tag,
        showTitle: showTitle ?? true,
        title: title,
        errorMessage: errorMessage,
        helpMessage: helpMessage,
        required: isRequired,
        status: status,
        value: value,
        weight: weight,
        showScrollBar: showScrollBar,
        scrollBarColor: scrollBarColor,
        hint: hint,
        items: items,
        callBack: callBack,
        scrollDirection: scrollDirection,
        unSelectedIcon: unSelectedIcon,
        selectedIcon: selectedIcon,
        scrollable: scrollable ?? false,
        height: height,
        searchable: searchable,
        searchHint: searchHint,
        searchIcon: searchIcon,
        searchBoxDecoration: searchBoxDecoration,
        requiredCheckListEnum: requiredCheckListEnum);
  }

  // */

  CFormField.text(
      {Key? key,
      required String tag,
      String? title,
      String? errorMessage,
      String? helpMessage,
      Widget? prefixWidget,
      Widget? postfixWidget,
      bool? required,
      bool? showTitle,
      CFormFieldStatusEnum? status,
      String? value,
      int? weight,
      RegExp? validateRegEx,
      int? maxLength,
      int? minLine,
      int? maxLine,
      String? hint})
      : super(key: key) {
    model = CFormTextModel(
      type: CFormFieldTypeEnum.text,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      maxLength: maxLength,
      hint: hint,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.password(
      {Key? key,
      required String tag,
      String? title,
      String? errorMessage,
      String? helpMessage,
      Widget? prefixWidget,
      bool? required,
      bool? showTitle,
      CFormFieldStatusEnum? status,
      String? value,
      int? weight,
      RegExp? validateReg,
      int? maxLength,
      int? minLine,
      int? maxLine,
      bool? isEnable,
      String? hint})
      : super(key: key) {
    model = CFormPasswordModel(
      type: CFormFieldTypeEnum.password,
      showTitle: showTitle ?? true,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      hint: hint,
      maxLength: maxLength,
      validateReg: validateReg,
    );
  }

  CFormField.textPlain(
      {Key? key,
      required String tag,
      String? title,
      String? errorMessage,
      String? helpMessage,
      Widget? prefixWidget,
      Widget? postfixWidget,
      bool? required,
      bool? showTitle,
      CFormFieldStatusEnum? status,
      String? value,
      int? weight,
      RegExp? validateRegEx,
      int? maxLength,
      int? minLine,
      int? maxLine,
      String? hint,
      bool? showCounter})
      : super(key: key) {
    model = CFormTextPlainModel(
      type: CFormFieldTypeEnum.textPlain,
      tag: tag,
      title: title,
      showTitle: showTitle ?? true,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      hint: hint,
      maxLine: maxLine,
      minLine: minLine,
      maxLength: maxLength,
      showCounter: showCounter,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.mobile({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    int? maxLength,
    String? hint,
  }) : super(key: key) {
    model = CFormMobileModel(
      type: CFormFieldTypeEnum.mobile,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      showTitle: showTitle ?? true,
      status: status,
      value: value,
      weight: weight,
      maxLength: maxLength,
      hint: hint,
      validateReg: validateRegEx,
    );
  }

  CFormField.number({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? required,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    int? maxLength,
    bool? showTitle,
    bool? showCounter,
    String? hint,
  }) : super(key: key) {
    model = CFormNumberModel<T>(
      type: CFormFieldTypeEnum.number,
      showTitle: showTitle ?? true,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      maxLength: maxLength,
      hint: hint,
      showCounter: showCounter,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.datePicker({
    Key? key,
    required String tag,
    required CFormCalendarType calendarType,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateReg,
    int? maxLength,
    String? hint,
    CFormDateFormatType? displayDateType,
    bool? isPastAvailable,
    CFormDate? initialDate,
    CFormDate? availableFrom,
    CFormDate? availableTo,
  }) : super(key: key) {
    model = CFormDatePickerModel(
      type: CFormFieldTypeEnum.date,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      showTitle: showTitle ?? true,
      calendarType: calendarType,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      hint: hint,
      isPastAvailable: isPastAvailable,
      dateFormatType: displayDateType,
      initialDate: initialDate,
      availableFrom: availableTo,
      availableTo: availableTo,
    );
  }

  CFormField.dateRangePicker({
    Key? key,
    required String tag,
    required CFormCalendarType calendarType,
    String? title,
    String? errorMessage,
    String? helpMessage,
    String? from,
    String? to,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateReg,
    int? maxLength,
    String? hint,
    CFormDateFormatType? displayDateType,
    bool? isPastAvailable,
    CFormDate? initialStartDate,
    CFormDate? initialEndDate,
    CFormDate? availableFrom,
    CFormDate? availableTo,
  }) : super(key: key) {
    model = CFormDateRangePickerModel(
      type: CFormFieldTypeEnum.dateRage,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      from: from ?? 'From ',
      to: to ?? 'To ',
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      showTitle: showTitle ?? true,
      required: required,
      status: status,
      value: value,
      weight: weight,
      hint: hint,
      isPastAvailable: isPastAvailable,
      dateFormatType: displayDateType,
      initialStartDate: initialStartDate,
      initialEndDate: initialEndDate,
      availableFrom: availableTo,
      availableTo: availableTo,
      calendarType: calendarType,
      validateReg: validateReg,
    );
  }

  CFormField.time({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? showTitle,
    bool? required,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateReg,
    int? maxLength,
    String? hint,
    TimeOfDay? initialTime,
    // TimePickerType ? timePickerType ,
  }) : super(key: key) {
    model = CFormTimePickerModel(
      type: CFormFieldTypeEnum.time,
      tag: tag,
      showTitle: showTitle ?? true,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      hint: hint,
      initialTime: initialTime,
      timePickerType: TimePickerType.english,
      validateReg: validateReg,
    );
  }

  CFormField.email({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    Widget? postfixWidget,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    int? maxLength,
    String? hint,
  }) : super(key: key) {
    model = CFormEmailModel(
      type: CFormFieldTypeEnum.email,
      tag: tag,
      title: title,
      showTitle: showTitle ?? true,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      value: value,
      weight: weight,
      maxLength: maxLength,
      hint: hint,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.price({
    Key? key,
    required String tag,
    String? title,
    String? errorMessage,
    String? helpMessage,
    Widget? prefixWidget,
    String? currencyName,
    bool? required,
    bool? showTitle,
    CFormFieldStatusEnum? status,
    String? value,
    int? weight,
    RegExp? validateRegEx,
    int? maxLength,
    String? hint,
  }) : super(key: key) {
    model = CFormPriceModel<T>(
      type: CFormFieldTypeEnum.price,
      tag: tag,
      title: title,
      showTitle: showTitle ?? true,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: Text(
        currencyName ?? '',
        style: CFormTheme.textThemeStyle.displaySmall,
      ),
      required: required,
      status: status,
      value: value,
      weight: weight,
      maxLength: maxLength,
      hint: hint,
      validateRegEx: validateRegEx,
    );
  }

  CFormField.bankCard(
      {Key? key,
      required String tag,
      String? title,
      String? errorMessage,
      String? helpMessage,
      Widget? prefixWidget,
      Widget? postfixWidget,
      bool? required,
      bool? showTitle,
      CFormFieldStatusEnum? status,
      String? value,
      int? weight,
      RegExp? validateRegEx,
      int? minLine,
      int? maxLine,
      String? hint})
      : super(key: key) {
    model = CFormBankCardModel(
      type: CFormFieldTypeEnum.bankCard,
      tag: tag,
      title: title,
      errorMessage: errorMessage,
      helpMessage: helpMessage,
      prefixWidget: prefixWidget,
      postfixWidget: postfixWidget,
      required: required,
      status: status,
      showTitle: showTitle ?? true,
      value: value,
      weight: weight,
      hint: hint,
      validateRegEx: validateRegEx,
    );
  }

// */

  //</editor-fold>

  @override
  State<CFormField<T>> createState() => _CFormFieldState<T>();
}

class _CFormFieldState<T> extends State<CFormField<T>> {
  @override
  void didUpdateWidget(covariant CFormField<T> oldWidget) {
    _fillChild();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _fillChild();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.formStyle = widget.formStyle ?? CFormStyle();
    widget.onUpdate = () {
      if (mounted) {
        if (widget.model.status != CFormFieldStatusEnum.disabled) {
          setState(() {});
        }
      }
    };

    return AbsorbPointer(
      absorbing: widget.model.status == CFormFieldStatusEnum.disabled,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Visibility(
                  visible: widget.model.showTitle!,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(widget.model.title ?? "",
                                style: widget.formStyle!.titleTextStyle),
                          ),
                          const SizedBox(width: 4.0),
                          Opacity(
                            opacity: widget.model.required ?? false ? 1 : 0,
                            child: Text(
                              widget.formStyle!.requiredText,
                              style: const TextStyle(
                                  color: CFormColors.red, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                    ],
                  ),
                ),
                Container(
                  decoration: CFormUtils.getFieldDecoration(
                      widget.formStyle!, widget.model.status),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible:
                            widget.model.prefixWidget == null ? false : true,
                        child: Row(
                          children: [
                            const SizedBox(width: 8.0),
                            widget.model.prefixWidget ??
                                const SizedBox(width: 0),
                            const SizedBox(width: 8.0),
                            Container(
                              height: 30.0,
                              color: CFormColors.dividerColor,
                              width: 1.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: widget.child!),
                      Visibility(
                        visible:
                            widget.model.postfixWidget == null ? false : true,
                        child: Row(
                          children: [
                            const SizedBox(width: 10.0),
                            widget.model.postfixWidget ??
                                const SizedBox(width: 0),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                Opacity(
                  opacity: (widget.model.status == CFormFieldStatusEnum.error &&
                              widget.model.errorMessage != null) ||
                          widget.model.helpMessage != null
                      ? 1
                      : 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8.0,
                        height: 8.0,
                        child: SvgPicture.asset(
                          widget.model.status == CFormFieldStatusEnum.error
                              ? 'packages/c_form/assets/ic_alret.svg'
                              : 'packages/c_form/assets/ic_info.svg',
                        ),
                      ),
                      const SizedBox(width: 1.0),
                      Flexible(
                        child: Text(
                          widget.model.status == CFormFieldStatusEnum.error
                              ? widget.model.errorMessage ?? ''
                              : widget.model.helpMessage ?? '',
                          style:
                              widget.model.status == CFormFieldStatusEnum.error
                                  ? widget.formStyle!.errorTextStyle
                                  : widget.formStyle!.helpTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _fillChild() {
    switch (widget.model.type) {
      case CFormFieldTypeEnum.text:
        widget.child =
            CFormTextField(widget.model as CFormTextModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.number:
        widget.child = CFormNumberField<T>(
            widget.model as CFormNumberModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.textPlain:
        widget.child = CFormTextPlainField(
            widget.model as CFormTextPlainModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.mobile:
        widget.child = CFormMobileField(
            widget.model as CFormMobileModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.password:
        widget.child = CFormPasswordField(
            widget.model as CFormPasswordModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.date:
        widget.child = CFormDatePickerField(
            widget.model as CFormDatePickerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.dateRage:
        widget.child = CFormDateRangePickerField(
            widget.model as CFormDateRangePickerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.time:
        widget.child = CFormTimePickerField(
            widget.model as CFormTimePickerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.email:
        widget.child =
            CFormEmailField(widget.model as CFormEmailModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.price:
        widget.child = CFormPriceField<T>(
            widget.model as CFormPriceModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.bankCard:
        widget.child = CFormBankCardField(
            widget.model as CFormBankCardModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.spinner:
        widget.child = CFormSpinnerField(
            widget.model as CFormSpinnerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.spinnerWithSearch:
        widget.child = CFormSpinnerWithSearchField(
            widget.model as CFormSpinnerWithSearchModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.spinnerWithSearchMulti:
        widget.child = CFormSpinnerWithSearchMultiField(
            widget.model as CFormSpinnerWithSearchMultiModel,
            widget.formStyle!);
        break;
      case CFormFieldTypeEnum.radioGroup:
        widget.child = CFormRadioGroupField(
            widget.model as CFormRadioModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.checkList:
        widget.child = CFormCheckListField(
            widget.model as CFormCheckBoxModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.imagePicker:
        widget.child = CFormImagePickerField(
            widget.model as CFormImagePickerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.qrScanner:
        widget.child = CFormQRScannerField(
            widget.model as CFormQRScannerModel, widget.formStyle!);
        break;
      case CFormFieldTypeEnum.multiImagePicker:
        widget.child = CFormMultiImagePickerField(
            widget.model as CFormMultiImagePickerModel, widget.formStyle!);
        break;

      default:
        widget.child = Container();
    }
  }
}
