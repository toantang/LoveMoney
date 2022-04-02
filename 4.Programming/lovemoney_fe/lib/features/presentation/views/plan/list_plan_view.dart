import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_state.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/information_plan.dart';

import '../../../../core/helper/navigation_screen.dart';
import '../../../domain/entities/plan.dart';
import '../../common_widget/list_tile_lv.dart';

class ListPlanView extends StatelessWidget {
  final BuildListPlanBloc? buildListPlanBloc;

  const ListPlanView({Key? key, this.buildListPlanBloc}) : super(key: key);

  Widget _buildOneItemTransaction(
      BuildContext context, Plan plan) {
    return Card(
      child: ListTileLv(
        onTap: () {
          Nav.pushTo(context, InformationPlan(plan: plan));
        },
        title: Center(
          child: Text(plan.name!),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildListPlan(BuildContext context) {
    return StreamBuilder<BuildListPlanState>(
      initialData: buildListPlanBloc!.buildListPlanState,
      stream: buildListPlanBloc!.remoteBuildListPlanState.stream,
      builder: (context, AsyncSnapshot<BuildListPlanState> snapshot) {
        if (snapshot.hasData) {
          List<Plan> plans = snapshot.data!.plans;

          return ListView.builder(
            itemCount:  plans.length,
            itemBuilder: (context, index) {
              return _buildOneItemTransaction(context, plans[index]);
            },
          );
        }
        else {
          return const Center(child: Text(ErrorConst.NULL_STREAM),);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BaseScreenWithBack(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _buildListPlan(context))
            ],
          ),
        ),
      ),
    );
  }
}
