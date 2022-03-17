import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';

class AddTransaction extends StatelessWidget {
  TextEditingController ecControllerCost = TextEditingController();
  TextEditingController ecControllerPeriodTime = TextEditingController();
  TextEditingController ecControllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldLv(
            textEditingController: ecControllerCost,
            keyUsedWord: KeyUsedWord.COST,
            textInputType: const TextInputType.numberWithOptions(signed: true)),
        ButtonLv(
          onPressed: () {},
          keyUsedWord: KeyUsedWord.TRANSACTION,
          icon: Icons.arrow_right,
        ),
        Row(
          children: [
            const Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: ListTileLv(),
            )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextFieldLv(
                  keyUsedWord: KeyUsedWord.PERIOD_TIME,
                  textEditingController: ecControllerPeriodTime,
                ),
              ),
            ),
          ],
        ),
        TextFieldLv(
            textEditingController: ecControllerNote,
            keyUsedWord: KeyUsedWord.NOTE),
        ButtonLv(onPressed: () {}, keyUsedWord: KeyUsedWord.ADD),
      ],
    );
  }
}
