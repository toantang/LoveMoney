class SelectExpectedDatePlanState {
  final DateTime expectedFinishedDatePlan;
  SelectExpectedDatePlanState(this.expectedFinishedDatePlan);
}

class TypeSumCostPlanState {
  double sumCostPlan;
  TypeSumCostPlanState(this.sumCostPlan);

  bool validateSumCostPlan() {
    if(sumCostPlan > 0.0) {
      return true;
    }
    return false;
  }
}

class TypeNamePlanState {
  String outputNamePlan;
  TypeNamePlanState(this.outputNamePlan);

  bool validateName() {
    if (outputNamePlan.isNotEmpty && outputNamePlan.length < 100) {
      return true;
    }
    return false;
  }
}