import 'package:lovemoney_fe/core/helper/remote_event.dart';

class TypeCostEvent extends RemoteEvent {
  final double cost;
  TypeCostEvent(this.cost);
}

class SelectNameEvent extends RemoteEvent {
  final String name;
  SelectNameEvent(this.name);
}

class SelectDateTransactionEvent extends RemoteEvent {
  final DateTime date;
  SelectDateTransactionEvent(this.date);
}

class TypePeriodTimeEvent extends RemoteEvent {
  final double? periodTime;
  TypePeriodTimeEvent({this.periodTime});
}

class TakeNoteEvent extends RemoteEvent {
  final String? note;
  TakeNoteEvent({this.note});

}

class TextFieldPeriodTimeEvent extends RemoteEvent {
  final String idTypeTransaction;
  TextFieldPeriodTimeEvent(this.idTypeTransaction);
}
