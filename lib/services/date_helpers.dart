// ignore_for_file: no_leading_underscores_for_local_identifiers

class DateHelpers {
  static String getStartDate() {
    var _date = DateTime.now();
    return '${_date.toLocal().day}/${_date.toLocal().month}/${_date.toLocal().year}';
  }
}
