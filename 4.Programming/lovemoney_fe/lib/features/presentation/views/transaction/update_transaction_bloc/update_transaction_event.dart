import 'package:lovemoney_fe/core/helper/remote_event.dart';

class UpdateDateEvent extends RemoteEvent {
  final DateTime newDate;
  UpdateDateEvent(this.newDate);
}

class UpdateCostEvent extends RemoteEvent {
  final double newCost;
  UpdateCostEvent(this.newCost);
}

class UpdateNoteEvent extends RemoteEvent {
  final String newNote;
  UpdateNoteEvent(this.newNote);
}