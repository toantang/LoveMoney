import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';

import '../../../../core/enum/enum_const.dart';
import '../../../../core/helper/format_text_to_number.dart';

class MoneyField extends StatelessWidget {
  final TextEditingController ecCost;
  final FormatTextToNumber formatTextToNumber = FormatTextToNumber();
  MoneyField({Key? key, required this.ecCost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecCost,
      keyUsedWord: KeyUsedWord.COST,
      textInputType: const TextInputType.numberWithOptions(
        signed: true,
      ),
      maxLength: 15,
        onChanged: (value) {
          ecCost.text =
              formatTextToNumber.changeText(value);
          ecCost.selection = TextSelection.fromPosition(
            TextPosition(
              offset: ecCost.text.length,
            ),
          );
        }
    );
  }
}