import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/error/custom_error.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/error_lv.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/email_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/name_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/password_field.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/register_bloc/register_state.dart';

import '../../../../core/helper/bloc_provider.dart';
import '../../../../core/helper/navigation_screen.dart';
import '../user/user_bloc/user_bloc.dart';
import '../user/user_bloc/user_event.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final TextEditingController ecName = TextEditingController();
  final TextEditingController ecEmail = TextEditingController();
  final TextEditingController ecPassword = TextEditingController();
  final TextEditingController ecConfirmPassword = TextEditingController();

  void _onTapRegisterButton(BuildContext context) async {
    final AuthBloc _authBloc = AuthBloc.getInstance();
    _authBloc.registerBloc.nameRegisterBloc.nameRegisterState = NameRegisterState(ecName.text);
    _authBloc.registerBloc.passwordRegisterBloc.passwordRegisterState = PasswordRegisterState(ecPassword.text);
    _authBloc.registerBloc.emailRegisterBloc.emailRegisterState = EmailRegisterState(ecEmail.text);
    _authBloc.registerBloc.confirmRegisterBloc.confirmRegisterState = ConfirmRegisterState(ecConfirmPassword.text);

    CustomError customError = await _authBloc.register();
    if (CustomError.validateCodeError(customError)) {
      _clearTextField();
      final UserBloc userBloc = BlocProvider.of(context)!;
      userBloc.remoteUserEvent.sink.add(NewUserEvent(newUser: AuthBloc.getInstance().user));
      Nav.to(context, ScreenPath.MAIN_PATH, arguments: userBloc);
    }

    NavSnackBar.displayError(context, customError: customError);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NameField(ecName: ecName),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: EmailField(ecEmail: ecEmail,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: PasswordField(ecPassword: ecPassword,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: PasswordField(ecPassword: ecConfirmPassword, keyUsedWord: KeyUsedWord.CONFIRM_PASSWORD, ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonLv(
                keyUsedWord: KeyUsedWord.REGISTER,
                onPressed: () {
                  _onTapRegisterButton(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    ecName.clear();
    ecEmail.clear();
    ecPassword.clear();
    ecConfirmPassword.clear();
  }
}
