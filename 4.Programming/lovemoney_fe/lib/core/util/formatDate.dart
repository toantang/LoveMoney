import 'package:intl/intl.dart';

class FormatDate {
  static String formatCurrentDate = dateToString(DateTime.now());
  static DateTime currentDate = DateTime.now();

  static String dateToString(DateTime date) {
    return DateFormat('MM-dd-yyyy').format(date);
  }

  static DateTime stringToDate(String date) {
    return DateFormat("MM-dd-yyyy").parse(date);
  }
}
