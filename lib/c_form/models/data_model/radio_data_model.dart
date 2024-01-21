class RadioDataModel {
  String title;
  bool isSelected;
  int id;

  /// S'il est définit il sera retourné comme valeur à la place de l'id
  String? stringId;
  dynamic data;

  RadioDataModel({
    required this.title,
    required this.id,
    bool? isSelected,
    this.data,
    this.stringId,
  }) : isSelected = isSelected ?? false;

  @override
  String toString() {
    return title;
  }
}
