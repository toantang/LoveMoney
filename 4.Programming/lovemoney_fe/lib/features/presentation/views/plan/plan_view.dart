import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/info_plan_bloc/infor_plan_event.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/list_plan_view.dart';

import '../../../../core/helper/navigation_screen.dart';
import '../../../domain/entities/plan.dart';
import '../../../domain/entities/status.dart';
import '../../common_widget/button_lv.dart';

class PlanView extends StatelessWidget {
  PlanView({Key? key}) : super(key: key);
  final BuildListPlanBloc buildListPlanBloc = BuildListPlanBloc();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: BlocProvider(
          bloc: buildListPlanBloc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonLv(
                keyUsedWord: KeyUsedWord.ADD_NEW_PLAN,
                onPressed: () {
                  Nav.pushTo(context, AddPlan());
                },
              ),
              ButtonLv(
                keyUsedWord: KeyUsedWord.FINISHED_PLAN,
                onPressed: () {
                  final Plan plan = Plan(
                    status: Status(
                      code: CodeStatus.FI,
                      name: NameStatus.FINISHED,
                    ),
                    user: AuthBloc.getInstance().user,
                  );
                  //buildListPlanBloc.openStream();
                  buildListPlanBloc.remoteBuildListPlanEvent.sink
                      .add(BuildListPlanEvent(plan));
                  Nav.pushTo(
                      context,
                      ListPlanView(
                        buildListPlanBloc: buildListPlanBloc,
                      ));
                },
              ),
              ButtonLv(
                keyUsedWord: KeyUsedWord.UNFINISHED_PLAN,
                onPressed: () {
                  final Plan plan = Plan(
                    status: Status(
                      code: CodeStatus.UNFI,
                      name: NameStatus.UNFINISHED,
                    ),
                    user: AuthBloc.getInstance().user,
                  );
                  //buildListPlanBloc.openStream();
                  buildListPlanBloc.remoteBuildListPlanEvent.sink
                      .add(BuildListPlanEvent(plan));
                  Nav.pushTo(
                      context,
                      ListPlanView(
                        buildListPlanBloc: buildListPlanBloc,
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
