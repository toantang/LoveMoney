import 'package:flutter/material.dart';

class NavDateTimePicker extends StatelessWidget {
  final DateTime? lowerDateTime;
  final DateTime? limitedDateTime;
  const NavDateTimePicker({Key? key, this.lowerDateTime, this.limitedDateTime}) : super(key: key);

  bool _limitedSelectDate(DateTime day) {
    if (day.isAfter(lowerDateTime?? DateTime(2000, 3, 26))) {
      return true;
    }
    return false;
  }

  int getDayOfMonth(int mm) {
    switch (mm) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      default:
        return 30;
    }
  }

  bool checkLeapYear(int yy) {
    if (yy % 400 == 0) {
      return true;
    }
    if (yy % 4 == 0 && yy % 100 != 0) {
      return true;
    }
    return false;
  }

  DateTime initDate() {
    if (lowerDateTime == null) {
      return DateTime.now();
    }
    int dd = lowerDateTime!.day;
    int mm = lowerDateTime!.month;
    int yy = lowerDateTime!.year;

    if (mm == 12) {
      if (dd == 31) {
        yy++;
        mm = 1;
        dd = 1;
      }
      else {
        dd++;
      }
    }
    else if (mm == 2) {
      if (checkLeapYear(yy)) {
        if (dd == 29) {
          dd = 1;
          mm++;
        }
        else {
          dd++;
        }
      }
      else {
        if (dd == 28) {
          dd = 1;
          mm++;
        }
      }
    }
    else {
      if (dd == getDayOfMonth(mm)) {
        dd = 1;
        mm++;
      }
      else {
        dd++;
      }
    }

    DateTime dateTime = DateTime(yy, mm, dd);
    return dateTime;
  }
  Widget _datePicker() {
    return DatePickerDialog(
      initialDate: initDate(),
      firstDate: lowerDateTime?? DateTime(2021),
      lastDate: limitedDateTime?? DateTime(2024),
      cancelText: 'CANCEL',
      confirmText: 'OK',
      selectableDayPredicate: _limitedSelectDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _datePicker();
  }
}
