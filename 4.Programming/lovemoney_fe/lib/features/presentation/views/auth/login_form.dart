import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';
import '../../../../core/util/screen_path.dart';
import '../../common_widget/text_field_lv.dart';
import '../../common_widget/text_lv.dart';
import 'package:lovemoney_fe/core/helper/navigation_screen.dart';

class LoginView extends StatelessWidget {
  final TextEditingController ecEmail = TextEditingController();
  final TextEditingController ecPassword = TextEditingController();

  LoginView({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldLv(
              textEditingController: ecEmail,
              keyUsedWord: KeyUsedWord.EMAIL,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextFieldLv(
                textEditingController: ecPassword,
                keyUsedWord: KeyUsedWord.PASSWORD,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonLv(
                keyUsedWord: KeyUsedWord.LOGIN,
                onPressed: () {},
              ),
            ),
            TextButton(
              child: const TextService(keyUsedWord: KeyUsedWord.REGISTER),
              onPressed: () {
                Nav.to(context, ScreenPath.REGISTER_PATH,);
              },
            ),
          ],
        ),
      ),
    );
  }
}
