import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final TextEditingController ecControllerName = TextEditingController();
  final TextEditingController ecControllerEmail = TextEditingController();
  final TextEditingController ecControllerPassword = TextEditingController();
  final TextEditingController ecControllerConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldLv(
              keyUsedWord: KeyUsedWord.NAME,
              textEditingController: ecControllerName,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextFieldLv(
                keyUsedWord: KeyUsedWord.EMAIL,
                textEditingController: ecControllerEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextFieldLv(
                keyUsedWord: KeyUsedWord.PASSWORD,
                textEditingController: ecControllerPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextFieldLv(
                keyUsedWord: KeyUsedWord.CONFIRM_PASSWORD,
                textEditingController: ecControllerConfirmPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonLv(
                keyUsedWord: KeyUsedWord.REGISTER,
                onPressed: () {
                  //userLanguageBloc?.eventController.sink.add(ChangeEnglish(English()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
