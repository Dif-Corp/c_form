class DateDataModel {
  DateTime dateServerType;
  int timeStamp;
  String showDateStr;

  DateDataModel(
      {required this.dateServerType,
      required this.timeStamp,
      required this.showDateStr});
}

class DateDataRangeModel {
  DateTime startDateServerType;
  DateTime endDateServerType;
  int startTimeStamp;
  int endTimeStamp;
  String displayStartDateStr;
  String displayEndDateStr;

  DateDataRangeModel(
      {required this.startDateServerType,
      required this.endDateServerType,
      required this.startTimeStamp,
      required this.endTimeStamp,
      required this.displayStartDateStr,
      required this.displayEndDateStr});
}

enum CFormDateFormatType {
  numeric, // 04/04/1401
  fullText, // samedi 04 juillet 1401
  mediumText, // samedi 4 juillet
  shortText, // 4 juillet 1401
}

enum CFormCalendarType { jalali, gregorian }

class CFormDate {
  int year;

  int month;

  int day;

  CFormDate({required this.year, required this.month, required this.day});
}
