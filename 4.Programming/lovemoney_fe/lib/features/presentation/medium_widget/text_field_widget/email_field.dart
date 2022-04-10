import 'package:flutter/cupertino.dart';

import '../../../../core/enum/enum_const.dart';
import '../../common_widget/text_field_lv.dart';

class EmailField extends StatelessWidget {
  final TextEditingController ecEmail;

  const EmailField({Key? key, required this.ecEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecEmail,
      keyUsedWord: KeyUsedWord.EMAIL,
      textInputType: TextInputType.emailAddress,
    );
  }
}