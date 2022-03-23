import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
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
import '../transaction/add_transaction_bloc/add_transaction_event.dart';

class AddPlan extends StatelessWidget {
  final TextEditingController ecControllerSumCost = TextEditingController();
  final TextEditingController ecControllerName = TextEditingController();

  final AddPlanBloc addPlanBloc = AddPlanBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldLv(
            textEditingController: ecControllerSumCost,
            keyUsedWord: KeyUsedWord.SUM_COST),
        TextFieldLv(
            textEditingController: ecControllerName,
            keyUsedWord: KeyUsedWord.NAME),
        Card(
          child: BlocProvider(
            bloc: addPlanBloc.selectExpectedDatePlanBloc,
            child: StreamBuilder<SelectExpectedDatePlanState>(
              initialData:
              addPlanBloc.selectExpectedDatePlanBloc.selectExpectedDatePlanState,
              stream: addPlanBloc.selectExpectedDatePlanBloc.remoteSelectExpectedDatePlanState.stream,
              builder: (context,
                  AsyncSnapshot<SelectExpectedDatePlanState> snapshot) {
                return ListTileLv(
                  onTap: () async {
                    final date = await Nav.pushTo(
                        context, const NavDateTimePicker());
                    String value =
                    FormatDate.dateToString(date as DateTime);
                    addPlanBloc.selectExpectedDatePlanBloc.remoteSelectExpectedDatePlanEvent.sink
                        .add(SelectDateTransactionEvent(
                        FormatDate.stringToDate(value)));
                  },
                  leading: Text(snapshot.data!.expectedFinishedDatePlan),
                  trailing: const Icon(
                    Icons.date_range,
                    size: SizeConst.sizeIconButton,
                  ),
                );
              },
            ),
          ),
        ),
        ListTileLv(),
        ButtonLv(onPressed: () {}, keyUsedWord: KeyUsedWord.ADD),
      ],
    );
  }
}
