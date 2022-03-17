import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';

import '../../common_widget/button_lv.dart';

class PlanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonLv(keyUsedWord: KeyUsedWord.ADD_NEW_PLAN, onPressed: () {},),
        ButtonLv(keyUsedWord: KeyUsedWord.FINISHED_PLAN, onPressed: () {},),
        ButtonLv(keyUsedWord: KeyUsedWord.UNFINISHED_PLAN, onPressed: () {},),
      ],
    );
  }
}