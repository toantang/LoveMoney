import 'dart:async';

import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/core/error/custom_error.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import '../../../../../core/util/formatDate.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/plan_repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_event.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_state.dart';

import '../../../../../core/util/remote_event.dart';
import '../../../../domain/entities/plan.dart';

class AddPlanBloc {
  final SelectExpectedDatePlanBloc selectExpectedDatePlanBloc =
      SelectExpectedDatePlanBloc();
  final TypeSumCostPlanBloc typeSumCostPlanBloc = TypeSumCostPlanBloc();
  final TypeNamePlanBloc typeNamePlanBloc = TypeNamePlanBloc();

  final PlanRepositoryImpl _planRepositoryImpl = PlanRepositoryImpl();

  bool checkPlan() {
    if (typeSumCostPlanBloc.typeSumCostPlanState.validateSumCostPlan() &&
        typeNamePlanBloc.typeNamePlanState.validateName()) {
      return true;
    }
    return false;
  }

  Future<CustomError> createPlan() async {
    if (!checkPlan()) {
      print('can not create plan');
      CustomError(code: ErrorCode.FAILED, name: ErrorConst.CREATE_PLAN_FAILED);
    }
    Status _status = Status(
      code: CodeStatus.UNFI,
      name: NameStatus.UNFINISHED,
    );

    Plan _plan = Plan(
      name: typeNamePlanBloc.typeNamePlanState.outputNamePlan,
      sumCost: typeSumCostPlanBloc.typeSumCostPlanState.sumCostPlan,
      expectedFinishDate: selectExpectedDatePlanBloc
          .selectExpectedDatePlanState.expectedFinishedDatePlan,
      lastUpdateDate: selectExpectedDatePlanBloc
          .selectExpectedDatePlanState.expectedFinishedDatePlan,
      sumCurrentMoney: 0.0,
      user: AuthBloc.getInstance().user,
      status: _status.copyWith(),
    );
    ApiResponse<Plan>? apiResponse = await _planRepositoryImpl.createPlan(plan: _plan.copyWith());
    Plan? plan = apiResponse?.result?.data;
    if (plan != null) {
      return CustomError(code: ErrorCode.SUCCESS, name: ErrorConst.CREATE_PLAN_SUCCESS);
    }

    return CustomError(code: ErrorCode.FAILED, name: ErrorConst.CREATE_PLAN_FAILED);
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
  void dispose() {}
}

class TypeNamePlanBloc extends BlocBase {
  TypeNamePlanState typeNamePlanState =
      TypeNamePlanState('no have name of plan');

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
  void dispose() {}
}

class SelectExpectedDatePlanBloc extends BlocBase {
  SelectExpectedDatePlanState selectExpectedDatePlanState =
      SelectExpectedDatePlanState(FormatDate.currentDate);

  final remoteSelectExpectedDatePlanState =
      StreamController<SelectExpectedDatePlanState>();
  final remoteSelectExpectedDatePlanEvent = StreamController<RemoteEvent>();

  SelectExpectedDatePlanBloc() {
    remoteSelectExpectedDatePlanEvent.stream.listen((RemoteEvent remoteEvent) {
      processExpectedFinishedDate(remoteEvent);
    });
  }

  void processExpectedFinishedDate(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectExpectedDatePlanEvent) {
      selectExpectedDatePlanState =
          SelectExpectedDatePlanState(remoteEvent.expectedDate);
    }
    remoteSelectExpectedDatePlanState.sink.add(selectExpectedDatePlanState);
  }

  @override
  void dispose() {
    //remoteSelectExpectedDatePlanState.close();
    //remoteSelectExpectedDatePlanEvent.close();
  }
}
