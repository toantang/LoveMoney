import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/error_lv.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/email_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/password_field.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/login_bloc/login_state.dart';
import '../../../../core/error/custom_error.dart';
import '../../../../core/util/screen_path.dart';
import '../../common_widget/base_screen.dart';
import 'package:lovemoney_fe/core/helper/navigation_screen.dart';

import '../user/user_bloc/user_bloc.dart';
import '../user/user_bloc/user_event.dart';
import 'auth_bloc/auth_bloc.dart';

class LoginView extends StatelessWidget {
  final TextEditingController ecEmail = TextEditingController();
  final TextEditingController ecPassword = TextEditingController();

  LoginView({Key? key, }) : super(key: key);

  void _clearTextField() {
    ecEmail.clear();
    ecPassword.clear();
  }

  void onTapLoginButton(BuildContext context) async {
    final AuthBloc authBloc = AuthBloc.getInstance();
    authBloc.loginBloc.emailLoginBloc.emailLoginState = EmailLoginState(ecEmail.text);
    authBloc.loginBloc.passwordLoginBloc.passwordLoginState = PasswordLoginState(ecPassword.text);
    CustomError customError = await authBloc.login();
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
            EmailField(ecEmail: ecEmail),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: PasswordField(ecPassword: ecPassword,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonLv(
                keyUsedWord: KeyUsedWord.LOGIN,
                onPressed: () {
                  onTapLoginButton(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
