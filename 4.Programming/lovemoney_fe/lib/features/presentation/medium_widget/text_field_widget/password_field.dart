import 'package:flutter/cupertino.dart';

import '../../../../core/enum/enum_const.dart';
import '../../common_widget/text_field_lv.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController ecPassword;
  final KeyUsedWord? keyUsedWord;
  const PasswordField({Key? key, required this.ecPassword, this.keyUsedWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecPassword,
      keyUsedWord: keyUsedWord ?? KeyUsedWord.PASSWORD,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      maxLength: 15,
      maxLines: 1,
      countText: '',
    );
  }
}