import 'package:flutter/widgets.dart';

class SpinnerDataModel {
  String name;
  int id;

  /// S'il est définit il sera retourné comme valeur à la place de l'id
  String? stringId;
  bool isSelected;
  dynamic data;
  Widget? leading;

  SpinnerDataModel({
    required this.name,
    required this.id,
    bool? isSelected,
    this.data,
    this.stringId,
    this.leading,
  }) : isSelected = isSelected ?? false;

  @override
  String toString() {
    return name;
  }

  ///custom comparing function to check if two instances are equal
  bool isEqual(SpinnerDataModel model) {
    return id == model.id;
  }
}
