import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/plan_repository_impl.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_event.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_state.dart';

import '../../../../domain/entities/plan.dart';

class BuildListPlanBloc extends BlocBase {
  final PlanRepositoryImpl _planRepositoryImpl = PlanRepositoryImpl();

  BuildListPlanState buildListPlanState = BuildListPlanState([]);
  final remoteBuildListPlanState = StreamController<BuildListPlanState>.broadcast();
  final remoteBuildListPlanEvent = StreamController<RemoteEvent>();
  //late StreamController<BuildListPlanState> remoteBuildListPlanState;
  //late StreamController<RemoteEvent> remoteBuildListPlanEvent;

  BuildListPlanBloc() {
    //openStream();
    remoteBuildListPlanEvent.stream.listen((RemoteEvent remoteEvent) {
      processBuildListPlan(remoteEvent);
    });
  }

  void processBuildListPlan(RemoteEvent remoteEvent) async {
    if (remoteEvent is BuildListPlanEvent) {
      Plan _plan = remoteEvent.plan;
      ApiResponse<List<Plan>>? listPlan = await _planRepositoryImpl.getPlans(plan: _plan);
      List<Plan>? plans = listPlan?.result?.data;
      if (plans != null) {
        buildListPlanState = BuildListPlanState(plans);
      }
      else {
        buildListPlanState = BuildListPlanState([]);
      }
    }

    remoteBuildListPlanState.sink.add(buildListPlanState);
  }

  void openStream() {
    //remoteBuildListPlanState = StreamController<BuildListPlanState>.broadcast();
    //remoteBuildListPlanEvent = StreamController<RemoteEvent>();
  }
  @override
  void dispose() {
    //remoteBuildListPlanState.close();
    //remoteBuildListPlanEvent.close();
  }

}