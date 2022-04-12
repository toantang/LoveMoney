import 'package:flutter/cupertino.dart';

import '../../../../core/enum/enum_const.dart';
import '../../common_widget/text_field_lv.dart';

class BioField extends StatelessWidget {
  final TextEditingController ecBio;

  const BioField({Key? key, required this.ecBio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecBio,
      keyUsedWord: KeyUsedWord.BIO,
      countText: '',
      maxLength: 100,
    );
  }
}