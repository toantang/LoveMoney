import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/format_text_to_number.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan_bloc/add_plan_state.dart';

import '../../../../core/constant/size_const.dart';
import '../../../../core/helper/bloc_provider.dart';
import '../../../../core/helper/formatDate.dart';
import '../../../../core/helper/navigation_screen.dart';
import '../../common_widget/date_time_picker_lv.dart';
import 'add_plan_bloc/add_plan_event.dart';

class AddPlan extends StatelessWidget {
  final TextEditingController ecControllerSumCost = TextEditingController();
  final TextEditingController ecControllerName = TextEditingController();

  final AddPlanBloc addPlanBloc = AddPlanBloc();

  AddPlan({Key? key}) : super(key: key);

  Widget _inputSumCost(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecControllerSumCost,
      keyUsedWord: KeyUsedWord.SUM_COST,
      textInputType: const TextInputType.numberWithOptions(signed: true),
      maxLength: 11,
    );
  }

  Widget _inputNamePlan(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecControllerName,
      keyUsedWord: KeyUsedWord.NAME,
      maxLength: 50,
      maxLines: 3,
      countText: '',
    );
  }

  Widget _selectExpectedDatePlan(BuildContext context) {
    return Card(
      child: BlocProvider(
        bloc: addPlanBloc.selectExpectedDatePlanBloc,
        child: StreamBuilder<SelectExpectedDatePlanState>(
          initialData: addPlanBloc
              .selectExpectedDatePlanBloc.selectExpectedDatePlanState,
          stream: addPlanBloc.selectExpectedDatePlanBloc
              .remoteSelectExpectedDatePlanState.stream,
          builder:
              (context, AsyncSnapshot<SelectExpectedDatePlanState> snapshot) {
            return ListTileLv(
              onTap: () async {
                final date =
                    await Nav.pushTo(context, const NavDateTimePicker());
                addPlanBloc.selectExpectedDatePlanBloc
                    .remoteSelectExpectedDatePlanEvent.sink
                    .add(
                  SelectExpectedDatePlanEvent(date as DateTime),
                );
              },
              leading: Text(FormatDate.dateToString(snapshot.data!.expectedFinishedDatePlan)),
              trailing: const Icon(
                Icons.date_range,
                size: SizeConst.sizeIconButton,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithBack(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                _inputSumCost(context),
                _inputNamePlan(context),
                _selectExpectedDatePlan(context),
              ],
            ),
          ),
          ButtonLv(
            keyUsedWord: KeyUsedWord.ADD,
            onPressed: () {
              addPlanBloc.typeSumCostPlanBloc.typeSumCostPlanState =
                  TypeSumCostPlanState(FormatTextToNumber.formatTextToDouble(ecControllerSumCost.text));
              addPlanBloc.typeNamePlanBloc.typeNamePlanState =
                  TypeNamePlanState(ecControllerName.text);
              addPlanBloc.createPlan();
            },
          ),
        ],
      ),
    );
  }
}
