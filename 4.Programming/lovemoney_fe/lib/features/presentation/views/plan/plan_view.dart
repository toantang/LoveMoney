import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/add_plan.dart';

import '../../../../core/helper/navigation_screen.dart';
import '../../common_widget/button_lv.dart';

class PlanView extends StatelessWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onPressed: () {},
        ),
        ButtonLv(
          keyUsedWord: KeyUsedWord.UNFINISHED_PLAN,
          onPressed: () {},
        ),
      ],
    );
  }
}
