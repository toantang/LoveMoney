import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import '../../common_widget/text_field_lv.dart';

class LoginView extends StatelessWidget {
  final TextEditingController ecEmail = TextEditingController();
  final TextEditingController ecPassword = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldLv(
          textEditingController: ecEmail,
          keyUsedWord: KeyUsedWord.EMAIL,
        ),
        TextFieldLv(
          textEditingController: ecPassword,
          keyUsedWord: KeyUsedWord.PASSWORD,
        ),
        ButtonLv(
          keyUsedWord: KeyUsedWord.LOGIN,
          onPressed: () {},
        )
      ],
    );
  }
}
