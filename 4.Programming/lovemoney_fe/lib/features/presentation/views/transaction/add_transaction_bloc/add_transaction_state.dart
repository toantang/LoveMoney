class TypeCostState {
  final double cost;
  TypeCostState(this.cost);
}

class SelectNameState {
  final String name;
  SelectNameState(this.name);
}

class SelectDateTransactionState {
  final DateTime date;
  SelectDateTransactionState(this.date);
}

class TypePeriodTimeState {

  final double? periodTime;
  TypePeriodTimeState({this.periodTime});
}

class TakeNoteState {
  final String? note;
  TakeNoteState({this.note});
}
class TextFieldPeriodTimeState {
  final bool enabled;
  TextFieldPeriodTimeState(this.enabled);
}