import 'package:flutter/cupertino.dart';

import '../../../../core/enum/enum_const.dart';
import '../../common_widget/text_field_lv.dart';

class NameField extends StatelessWidget {
  final TextEditingController ecName;
  const NameField({Key? key, required this.ecName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      keyUsedWord: KeyUsedWord.NAME,
      textEditingController: ecName,
      maxLength: 50,
      countText: '',
    );
  }
}