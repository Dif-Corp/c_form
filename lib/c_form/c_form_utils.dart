import 'dart:developer';
import 'dart:io';

import 'package:c_form/c_form/enums/image_source.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:c_form/c_form/c_form_colors.dart';
import 'package:c_form/c_form/c_form_field_status_enum.dart';
import 'package:c_form/c_form/c_form_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class CFormUtils {
  static bool checkIfDarkModeEnabled(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  static Decoration getFieldDecoration(
      CFormStyle style, CFormFieldStatusEnum? status,
      {double? borderWidth = 1.0}) {
    Color backgroundColor;
    Color borderColor;

    switch (status) {
      case CFormFieldStatusEnum.error:
        backgroundColor = CFormColors.redOpacity;
        borderColor = CFormColors.red;
        break;
      case CFormFieldStatusEnum.success:
        backgroundColor = CFormColors.greenOpacity;
        borderColor = CFormColors.green;
        break;
      case CFormFieldStatusEnum.normal:
        backgroundColor = style.backgroundFieldColor;
        borderColor = style.fieldBorderColor;
        break;
      case CFormFieldStatusEnum.disabled:
        backgroundColor = style.backgroundFieldColorDisable;
        borderColor = style.fieldBorderColor;
        break;
      default:
        backgroundColor = CFormColors.white;
        borderColor = CFormColors.white;
    }
    return ShapeDecoration(
      color: backgroundColor,
      shape: SmoothRectangleBorder(
        side: BorderSide(color: borderColor, width: borderWidth ?? 1.0),
        borderRadius: SmoothBorderRadius(
          cornerRadius: style.fieldRadius,
          cornerSmoothing: 1,
        ),
      ),
    );
  }

  static showImagePickerBottomSheet(
    BuildContext context,
    void Function(File image) callback, {
    String? galleryName = 'Gallery', // REVIEW-
    String? cameraName = 'Camera', // REVIEW-
    String? cameraAssets,
    String? galleryAssets,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: [
              SizedBox(
                height: 130.0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            pickImage(ImageSource.camera).then((imageFile) {
                              if (imageFile != null) {
                                callback(imageFile);
                              }
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cameraAssets == null
                                  ? const Icon(
                                      Icons.camera,
                                      size: 40.0,
                                      color: Colors.blue,
                                    )
                                  : SvgPicture.asset(
                                      cameraAssets,
                                      width: 40.0,
                                      height: 40.0,
                                    ),
                              const SizedBox(height: 10.0),
                              Text(
                                cameraName ?? 'Camera',
                                style: CFormStyle().titleTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            pickImage(ImageSource.gallery).then((imageFile) {
                              if (imageFile != null) {
                                callback(imageFile);
                              }
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              galleryAssets == null
                                  ? const Icon(
                                      Icons.photo_library,
                                      size: 40.0,
                                      color: Colors.blue,
                                    )
                                  : SvgPicture.asset(
                                      galleryAssets,
                                      width: 40.0,
                                      height: 40.0,
                                    ),
                              const SizedBox(height: 10.0),
                              Text(
                                galleryName ?? 'Gallery',
                                style: CFormStyle().titleTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<File?> pickImage(ImageSource imageSource) async {
    AssetEntity? entity;
    try {
      //
      if (imageSource == ImageSource.camera) {
        entity = await CameraPicker.pickFromCamera(
          Get.context!,
          // locale: Get.locale, // TODO des que le fraiçais sera disponible
          locale: const Locale('en'),
          pickerConfig: const CameraPickerConfig(
            shouldDeletePreviewFile: true,
          ),
        );
      }

      if (imageSource == ImageSource.gallery) {
        final List<AssetEntity>? result =
            await AssetPicker.pickAssets(Get.context!,
                pickerConfig: AssetPickerConfig(
                  maxAssets: 1,
                  requestType: RequestType.image,
                  filterOptions: FilterOptionGroup(),
                ));
        if (result != null) {
          entity = result.first;
        }
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }

    if (entity != null) {
      // return File(image.path);
      return entity.file;
    }

    return null;
  }

  static bool isDirectionRTL(BuildContext context) {
    return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
  }

  /// * Explication par ChatGPT
  ///
  /// Ce code est une fonction générique en Dart appelée "asT" qui prend une valeur "value" de type dynamique et renvoie la valeur "value" convertie en type T ou renvoie null si la conversion échoue.
  ///
  /// La fonction commence par vérifier si la valeur "value" est déjà du type T en utilisant l'opérateur "is". Si c'est le cas, elle renvoie simplement "value". Sinon, la fonction essaie de convertir "value" en type T en fonction de certaines conditions.
  ///
  /// La première condition vérifie si T est un entier en vérifiant si 0 est de type T. Si c'est le cas, la fonction essaie de convertir la valeur en entier en utilisant la méthode "tryParse" de la classe "int" et renvoie le résultat de la conversion sous forme de type T.
  ///
  /// La deuxième condition vérifie si T est un double en vérifiant si 0.0 est de type T. Si c'est le cas, la fonction essaie de convertir la valeur en double en utilisant la méthode "tryParse" de la classe "double" et renvoie le résultat de la conversion sous forme de type T.
  ///
  /// La troisième condition vérifie si T est une chaîne de caractères en vérifiant si '' est de type T. Si c'est le cas, la fonction renvoie simplement la valeur "value" sous forme de type T en utilisant la méthode "toString".
  ///
  /// La quatrième condition vérifie si T est un booléen en vérifiant si false est de type T. Si c'est le cas, la fonction essaie de convertir la valeur en booléen en vérifiant si elle correspond à "true", "false", "0" ou "1". Si la valeur correspond à "true" ou "1", la fonction renvoie true sous forme de type T. Si la valeur correspond à "false" ou "0", la fonction renvoie false sous forme de type T. Sinon, la fonction renvoie null.
  ///
  /// Si la valeur "value" est null ou si aucune des conditions précédentes n'est vraie, la fonction renvoie simplement null.
  ///
  static T? asT<T>(dynamic value) {
    if (value is T) {
      return value;
    }
    if (value != null) {
      final String valueS = value.toString();
      if (0 is T) {
        return int.tryParse(valueS) as T?;
      } else if (0.0 is T) {
        return double.tryParse(valueS) as T?;
      } else if ('' is T) {
        return valueS as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      }
    }
    return null;
  }

  static String removeSpaces(String value) {
    return value.replaceAll(RegExp(r'[\s ]+'), '');
  }
}

class CardNumberFormatter extends TextInputFormatter {
  final sampleNumber = '0000 0000 0000 0000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > sampleNumber.length) {
        return oldValue;
      }

      final lastEnteredLetter =
          newValue.text.substring(newValue.text.length - 1);
      if (!RegExp(r'[0-9]').hasMatch(lastEnteredLetter)) {
        return oldValue;
      }

      if (newValue.text.isNotEmpty &&
          sampleNumber[newValue.text.length - 1] == ' ') {
        return TextEditingValue(
          text:
              '${oldValue.text} ${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
    }
    return newValue;
  }
}
