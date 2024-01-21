class SpinnerDataModel {
  String name;
  int id;

  /// S'il est définit il sera retourné comme valeur à la place de l'id
  String? stringId;
  bool isSelected;
  dynamic data;

  SpinnerDataModel({
    required this.name,
    required this.id,
    bool? isSelected,
    this.data,
    this.stringId,
  }) : isSelected = isSelected ?? false;

  @override
  String toString() {
    return name;
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(SpinnerDataModel model) {
    return id == model.id;
  }
}
