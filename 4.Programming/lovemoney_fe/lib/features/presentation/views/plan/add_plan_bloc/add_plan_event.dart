import 'package:lovemoney_fe/core/helper/remote_event.dart';

class SelectExpectedDatePlanEvent extends RemoteEvent {
  DateTime expectedDate;
  SelectExpectedDatePlanEvent(this.expectedDate);
}

class TypeSumCostPlanEvent extends RemoteEvent {
  double sumCost;
  TypeSumCostPlanEvent(this.sumCost);
}

class TypeNamePlanEvent extends RemoteEvent {
  String inputNamePlan;
  TypeNamePlanEvent(this.inputNamePlan);
}