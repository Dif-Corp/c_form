import 'package:flutter/material.dart';
import 'package:c_form/c_form/models/c_form_field_model.dart';

class CFormImagePickerModel extends CFormFieldModel {
  String? hint;
  Widget iconWidget;
  String? cameraPopupTitle;
  String? galleryPopupTitle;
  String? cameraPopupIcon;
  String? galleryPopupIcon;
  CFormImageSource? imageSource;
  bool? showCropper;
  double? maximumSizePerImageInBytes;
  VoidCallback? onErrorSizeItem;

  CFormImagePickerModel({
    type,
    tag,
    title,
    errorMessage,
    helpMessage,
    required,
    status,
    weight,
    showTitle,
    defaultValue,
    required this.iconWidget,
    this.cameraPopupIcon,
    this.galleryPopupIcon,
    this.showCropper,
    this.cameraPopupTitle,
    this.galleryPopupTitle,
    this.imageSource,
    this.hint,
    this.maximumSizePerImageInBytes,
    this.onErrorSizeItem,
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
            defaultValue: defaultValue);
}

enum CFormImageSource { camera, gallery, both }
