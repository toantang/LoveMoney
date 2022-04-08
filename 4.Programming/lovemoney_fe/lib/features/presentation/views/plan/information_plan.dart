import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/helper/formatDate.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';

import '../../../../../core/enum/enum_const.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../domain/entities/plan.dart';
import '../../common_widget/list_tile_lv.dart';
import '../../common_widget/text_lv.dart';

class InformationPlan extends StatelessWidget {

  final Plan plan;
  const InformationPlan({
    Key? key,
    required this.plan,
  }) : super(key: key);

  Widget _buildLine(BuildContext context,
       {
         required KeyUsedWord keyUsedWord,
         required String content,
      VoidCallback? onPressed,
      }) {
    return ListTileLv(
      leading: TextLv(keyUsedWord: keyUsedWord),
      title: Text(
        content,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.edit,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _infoSumCost(BuildContext context, double sumCost) {
    return _buildLine(context, keyUsedWord: KeyUsedWord.SUM_COST, content: sumCost.toString());
  }

  Widget _infoSumCurrentMoney(BuildContext context, double sumCurrentMoney) {
    return _buildLine(context, keyUsedWord: KeyUsedWord.COST, content: sumCurrentMoney.toString());
  }

  Widget _infoExpectedFinishedDate(BuildContext context, String date) {
    return _buildLine(context, keyUsedWord: KeyUsedWord.EXPECTED_FINISH_DATE, content: date);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialogLv(
      title: Text(plan.name!),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _infoSumCost(context, plan.sumCost!),
          _infoSumCurrentMoney(context, plan.sumCurrentMoney!),
          _infoExpectedFinishedDate(context, FormatDate.dateToString(plan.expectedFinishDate!)),
        ],
      ),
      actions: [
        ButtonLv(
          onPressed: () {},
          keyUsedWord: KeyUsedWord.CONFIRM,
        ),
        ButtonLv(
          onPressed: () {
            Nav.back(context);
          },
          keyUsedWord: KeyUsedWord.BACK,
        ),
      ],
    );
  }
}
