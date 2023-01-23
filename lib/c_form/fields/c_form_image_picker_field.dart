import 'dart:io';

import 'package:c_form/c_form/enums/tmage_source.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:c_form/c_form/c_form_colors.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:c_form/c_form/c_form_utils.dart';
import 'package:c_form/c_form/core/c_form_field_call_back.dart';
import 'package:c_form/c_form/models/c_form_image_picker_model.dart';

// ignore: must_be_immutable
class CFormImagePickerField extends StatefulWidget
    implements CFormFieldCallBack {
  final CFormImagePickerModel model;
  final CFormStyle formStyle;

  CFormImagePickerField(this.model, this.formStyle, {Key? key})
      : super(key: key);
  String? _croppedFilePath;

  @override
  State<CFormImagePickerField> createState() => _CFormImagePickerFieldState();

  @override
  getValue() {
    return _croppedFilePath;
  }

  @override
  bool isValid() {
    if (!(model.required ?? false)) {
      return true;
    } else {
      return _croppedFilePath != null;
    }
  }
}

class _CFormImagePickerFieldState extends State<CFormImagePickerField> {
  @override
  void initState() {
    super.initState();
    if (widget.model.defaultValue != null) {
      widget._croppedFilePath = widget.model.defaultValue;
    } else {
      widget._croppedFilePath = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onTap: () {
          if (widget.model.imageSource == CFormImageSource.both) {
            CFormUtils.showImagePickerBottomSheet(
              cameraName: widget.model.cameraPopupTitle,
              galleryName: widget.model.galleryPopupTitle,
              cameraAssets: widget.model.cameraPopupIcon,
              galleryAssets: widget.model.galleryPopupIcon,
              context,
              (image) async {
                _fillImagePath(image);
              },
            );
          } else if (widget.model.imageSource == CFormImageSource.camera) {
            CFormUtils.pickImage(ImageSource.camera).then(
              (imageFile) {
                if (imageFile != null) {
                  _fillImagePath(imageFile);
                }
              },
            );
          } else {
            CFormUtils.pickImage(ImageSource.gallery).then(
              (imageFile) {
                if (imageFile != null) {
                  _fillImagePath(imageFile);
                }
              },
            );
          }
        },
        child: widget._croppedFilePath == null
            ? NormalView(model: widget.model, formStyle: widget.formStyle)
            : ImagePickedView(
                croppedFilePath: widget._croppedFilePath!,
                model: widget.model,
                formStyle: widget.formStyle,
                onDeleteImage: () {
                  widget._croppedFilePath = null;
                  setState(() {});
                }),
      ),
    );
  }

  _fillImagePath(File image) {
    if (widget.model.showCropper ?? false) {
      _cropImage(image);
    } else {
      setState(() {});
      widget._croppedFilePath = image.path;
    }
  }

  Future<void> _cropImage(File image) async {
    return;
    //   final croppedFile = await ImageCropper().cropImage(
    //     sourcePath: image.path,
    //     compressFormat: ImageCompressFormat.jpg,
    //     compressQuality: 100,
    //     uiSettings: [
    //       AndroidUiSettings(
    //           toolbarTitle: 'ویرایش تصویر',
    //           toolbarColor: CFormFormColors.white,
    //           toolbarWidgetColor: Colors.black,
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: false),
    //       IOSUiSettings(
    //         title: 'Cropper',
    //       ),
    //     ],
    //   );
    //   if (croppedFile != null) {
    //     setState(() {
    //       widget._croppedFilePath = croppedFile.path;
    //     });
    //   }
  }
}

class NormalView extends StatelessWidget {
  const NormalView({required this.model, required this.formStyle, Key? key})
      : super(key: key);
  final CFormImagePickerModel model;
  final CFormStyle formStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          model.iconWidget,
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: model.required ?? false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4, left: 4),
                  child: Text(
                    formStyle.requiredText,
                    style: const TextStyle(
                      color: CFormColors.red,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Text(
                model.title ?? '',
                style: formStyle.titleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 6.0),
          Text(
            model.hint ?? '',
            style: formStyle.fieldHintStyle,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ImagePickedView extends StatelessWidget {
  String croppedFilePath;
  final CFormImagePickerModel model;
  final CFormStyle formStyle;
  final VoidCallback onDeleteImage;

  ImagePickedView(
      {required this.croppedFilePath,
      Key? key,
      required this.model,
      required this.formStyle,
      required this.onDeleteImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(croppedFilePath), fit: BoxFit.contain),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 32.0,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: SmoothBorderRadius.only(
                    bottomLeft: SmoothRadius(
                      cornerRadius: 11.0,
                      cornerSmoothing: 1,
                    ),
                    bottomRight: SmoothRadius(
                      cornerRadius: 11.0,
                      cornerSmoothing: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        model.title!,
                        style: formStyle.titleTextStyle
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 20.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            onDeleteImage.call();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                'Effacer',
                                maxLines: 1,
                                style: formStyle.titleTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
