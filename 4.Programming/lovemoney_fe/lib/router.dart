import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/login_form.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';
import 'features/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';

class RouterLV {
  static final Map<String, WidgetBuilder> pages = {
    '/login': (context) {
      final UserLanguageBloc userLanguageBloc = UserLanguageBloc();
      return Scaffold(
        body: BlocProvider(
          bloc: userLanguageBloc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginView(),
            ],
          ),
        ),
      );
    },
    '/register': (context) {
      return const RegisterForm();
    }
  };
}
