import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/authScreen.dart';
import 'package:lovemoney_fe/features/presentation/views/main/views/main_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/edit_profile_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/views/profile_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_bloc.dart';

import 'features/presentation/views/profile_screen/update_user_bloc/update_user_bloc.dart';

class RouterLV {
  static final Map<String, WidgetBuilder> pages = {
    ScreenPath.PROFILE_PATH: (context) => ProfileScreen(
          updateUserBloc:
              ModalRoute.of(context)?.settings.arguments as UpdateUserBloc,
        ),
    ScreenPath.EDIT_PROFILE_PATH: (context) => EditProfileScreen(
          updateUserBloc:
              ModalRoute.of(context)?.settings.arguments as UpdateUserBloc,
        ),
    ScreenPath.MAIN_PATH: (context) => MainScreen(userBloc:  ModalRoute.of(context)?.settings.arguments as UserBloc,),
    ScreenPath.AUTH_PATH: (context) => AuthScreen(),
  };
}
