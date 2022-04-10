import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/user_repository_impl.dart';
import 'package:lovemoney_fe/features/data/shared_preferences/authentication_storage.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/email_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/password_field.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/login_bloc/login_state.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';
import '../../../../core/util/screen_path.dart';
import '../../../domain/entities/user.dart';
import '../../common_widget/base_screen.dart';
import '../../common_widget/text_field_lv.dart';
import '../../common_widget/text_lv.dart';
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
    if (await authBloc.login()) {
      _clearTextField();
      final UserBloc userBloc = BlocProvider.of(context)!;
      if (userBloc.closedStream) {
        userBloc.openStream();
        print('stream is closed');
      }
      userBloc.remoteUserEvent.sink.add(NewUserEvent(newUser: AuthBloc.getInstance().user));
      Nav.to(context, ScreenPath.HOME_PATH);
    }
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
