import 'package:c_form/c_form/models/c_form_field_model.dart';
import 'package:c_form/c_form/models/c_form_image_picker_model.dart';
import 'package:flutter/material.dart';

class CFormMultiImagePickerModel extends CFormFieldModel {
  String? hint;
  Widget iconWidget;
  String? cameraPopupTitle;
  String? galleryPopupTitle;
  String? cameraPopupIcon;
  String? galleryPopupIcon;
  CFormImageSource? imageSource;
  bool? showCropper;
  List<String>? defaultImagePath;
  double? maximumSizePerImageInKB;
  double? maximumImageCount;
  VoidCallback? onErrorSizeItem;

  CFormMultiImagePickerModel({
    type,
    tag,
    title,
    errorMessage,
    helpMessage,
    required,
    status,
    weight,
    showTitle,
    required this.iconWidget,
    this.maximumImageCount,
    this.onErrorSizeItem,
    this.maximumSizePerImageInKB,
    this.defaultImagePath,
    this.cameraPopupIcon,
    this.galleryPopupIcon,
    this.showCropper,
    this.cameraPopupTitle,
    this.galleryPopupTitle,
    this.imageSource,
    this.hint,
  }) : super(
          type: type,
          tag: tag,
          title: title,
          errorMessage: errorMessage,
          helpMessage: helpMessage,
          required: required,
          status: status,
          weight: weight,
          showTitle: showTitle,
        );
}
