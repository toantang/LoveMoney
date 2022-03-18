import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/constant/size_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_lv.dart';

class AddTransaction extends StatelessWidget {
  final TextEditingController ecControllerCost = TextEditingController();
  final TextEditingController ecControllerPeriodTime = TextEditingController();
  final TextEditingController ecControllerNote = TextEditingController();

  AddTransaction({Key? key}) : super(key: key);

  Widget _inputCost() {
    return TextFieldLv(
      textEditingController: ecControllerCost,
      keyUsedWord: KeyUsedWord.COST,
      textInputType: const TextInputType.numberWithOptions(
        signed: true,
      ),
      maxLength: 15,
    );
  }

  Widget _inputNameTransaction() {
    return SizedBox(
      height: 48,
      child: Card(
        color: ColorConst.primaryColorConst.greenShade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTileLv(
          onTap: () {},
          title: Center(
            child: TextLv(
              keyUsedWord: KeyUsedWord.TRANSACTION,
              textStyle: TextStyle(
                  fontSize: 30, color: ColorConst.medialColorConst.white),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            size: SizeConst.sizeIconButton,
          ),
        ),
      ),
    );
  }

  Widget _inputDateAndPeriodTime() {
    return Row(
      children: [
        const Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Card(
            child: ListTileLv(
              trailing: Icon(
                Icons.date_range,
                size: SizeConst.sizeIconButton,
              ),
            ),
          ),
        )),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextFieldLv(
              keyUsedWord: KeyUsedWord.PERIOD_TIME,
              textEditingController: ecControllerPeriodTime,
              maxLength: 2,
              textInputType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: false,
              ),
              countText: '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputNote() {
    return SizedBox(
      child: TextFieldLv(
        textEditingController: ecControllerNote,
        keyUsedWord: KeyUsedWord.NOTE,
        maxLines: 4,
        maxLength: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                child: _inputCost(),
                padding: const EdgeInsets.only(top: 26),
              ),
              Padding(
                child: _inputNameTransaction(),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: _inputDateAndPeriodTime(),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: _inputNote(),
                padding: const EdgeInsets.only(top: 16),
              ),
              Padding(
                child: ButtonLv(
                  onPressed: () {},
                  keyUsedWord: KeyUsedWord.ADD,
                  textStyle: const TextStyle(
                    fontSize: SizeConst.sizeTextButton,
                  ),
                ),
                padding: const EdgeInsets.only(top: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
