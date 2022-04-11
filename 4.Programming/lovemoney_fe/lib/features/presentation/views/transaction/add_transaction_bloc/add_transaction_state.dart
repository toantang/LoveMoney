class TypeCostState {
  final double cost;
  TypeCostState(this.cost);

  bool validateCost() {
    if (cost > 0.0) {
      return true;
    }
    return false;
  }
}

class SelectNameState {
  final String name;
  SelectNameState(this.name);

  bool validateNameTransaction() {
    if (name.isNotEmpty && name.length < 100 && name != 'TRANSACTION') {
      return true;
    }
    return false;
  }
}

class SelectDateTransactionState {
  final DateTime date;
  SelectDateTransactionState(this.date);

  bool validateDate() {
    return true;
  }
}

class TypePeriodTimeState {
  final double? periodTime;
  TypePeriodTimeState({this.periodTime});

  bool validatePeriodTime() {
    if (periodTime! > 0.0) {
      return true;
    }
    return false;
  }
}

class TakeNoteState {
  final String? note;
  TakeNoteState({this.note});

  bool validateNote() {
    return true;
  }
}
class TextFieldPeriodTimeState {
  final bool enabled;
  TextFieldPeriodTimeState(this.enabled);
}