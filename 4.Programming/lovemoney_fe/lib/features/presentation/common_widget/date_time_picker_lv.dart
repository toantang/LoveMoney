import 'package:flutter/material.dart';

class NavDateTimePicker extends StatelessWidget {
  final DateTime? lowerDateTime;
  const NavDateTimePicker({Key? key, this.lowerDateTime}) : super(key: key);

  bool _limitedSelectDate(DateTime day) {
    if (day.isAfter(lowerDateTime?? DateTime(2000, 3, 26))) {
      return true;
    }
    return false;
  }

  Widget _datePicker() {
    return DatePickerDialog(
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
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
