import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/plan_repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_event.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_state.dart';

import '../../../../domain/entities/plan.dart';

class AddPlanBloc {
  final SelectExpectedDatePlanBloc selectExpectedDatePlanBloc = SelectExpectedDatePlanBloc();
  final TypeSumCostPlanBloc typeSumCostPlanBloc = TypeSumCostPlanBloc();
  final TypeNamePlanBloc typeNamePlanBloc = TypeNamePlanBloc();

  final PlanRepositoryImpl _planRepositoryImpl = PlanRepositoryImpl();

  void createPlan() {
    Status _status = Status(
      code: CodeStatus.UNFI,
      name: NameStatus.UNFINISHED,
    );

    Plan _plan = Plan(
      name: typeNamePlanBloc.typeNamePlanState.outputNamePlan,
      sumCurrentMoney: typeSumCostPlanBloc.typeSumCostPlanState.sumCostPlan,
      expectedFinishDate: selectExpectedDatePlanBloc.selectExpectedDatePlanState.expectedFinishedDatePlan,
      status: _status.copyWith(),
    );

    _planRepositoryImpl.createPlan(plan: _plan.copyWith());
  }
}

class TypeSumCostPlanBloc extends BlocBase {
  TypeSumCostPlanState typeSumCostPlanState = TypeSumCostPlanState(0.0);

  final remoteTypeSumCostPlanState = StreamController<TypeSumCostPlanState>();
  final remoteTypeSumCostPlanEvent = StreamController<RemoteEvent>();

  TypeSumCostPlanBloc() {
    remoteTypeSumCostPlanEvent.stream.listen((RemoteEvent remoteEvent) {
      processSumCostPlan(remoteEvent);
    });
  }

  void processSumCostPlan(RemoteEvent remoteEvent) {
    if (remoteEvent is TypeSumCostPlanEvent) {
      typeSumCostPlanState = TypeSumCostPlanState(remoteEvent.sumCost);
    }
    remoteTypeSumCostPlanState.sink.add(typeSumCostPlanState);
  }
  @override
  void dispose() {

  }
}

class TypeNamePlanBloc extends BlocBase {
  TypeNamePlanState typeNamePlanState = TypeNamePlanState('no have name of plan');

  final remoteTypeNamePlanState = StreamController<TypeNamePlanState>();
  final remoteTypeNamePlanEvent = StreamController<RemoteEvent>();

  TypeNamePlanBloc() {
    remoteTypeNamePlanEvent.stream.listen((RemoteEvent remoteEvent) {
      processInputNamePlan(remoteEvent);
    });
  }

  void processInputNamePlan(RemoteEvent remoteEvent) {
    if (remoteEvent is TypeNamePlanEvent) {
      typeNamePlanState = TypeNamePlanState(remoteEvent.inputNamePlan);
    }
    remoteTypeNamePlanState.sink.add(typeNamePlanState);
  }
  @override
  void dispose() {
  }

}
class SelectExpectedDatePlanBloc extends BlocBase {
  SelectExpectedDatePlanState selectExpectedDatePlanState = SelectExpectedDatePlanState(FormatDate.formatCurrentDate);

  final remoteSelectExpectedDatePlanState = StreamController<SelectExpectedDatePlanState>();
  final remoteSelectExpectedDatePlanEvent = StreamController<RemoteEvent>();

  SelectExpectedDatePlanBloc() {
    remoteSelectExpectedDatePlanEvent.stream.listen((RemoteEvent remoteEvent) {
      processExpectedFinishedDate(remoteEvent);
    });
  }

  void processExpectedFinishedDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectExpectedDatePlanEvent) {
      selectExpectedDatePlanState = SelectExpectedDatePlanState(FormatDate.dateToString(remoteEvent.expectedDate));
    }
    remoteSelectExpectedDatePlanState.sink.add(selectExpectedDatePlanState);
  }

  @override
  void dispose() {
    remoteSelectExpectedDatePlanState.close();
    remoteSelectExpectedDatePlanEvent.close();
  }
}