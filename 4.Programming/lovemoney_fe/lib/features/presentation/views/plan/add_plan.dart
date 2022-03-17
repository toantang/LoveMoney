import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';

class AddPlan extends StatelessWidget {
  final TextEditingController ecControllerSumCost = TextEditingController();
  final TextEditingController ecControllerName = TextEditingController();

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
        ListTileLv(),
        ListTileLv(),
        ButtonLv(onPressed: () {}, keyUsedWord: KeyUsedWord.ADD),
      ],
    );
  }
}
