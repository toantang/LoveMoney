import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/authScreen.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/login_form.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';
import 'package:lovemoney_fe/features/presentation/views/main/views/main_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/views/profile_screen.dart';

import 'features/domain/entities/user.dart';

class RouterLV {
  static final Map<String, WidgetBuilder> pages = {
    ScreenPath.PROFILE_PATH: (context) => ProfileScreen(user: ModalRoute.of(context)?.settings.arguments as User,),
    ScreenPath.HOME_PATH: (context) => MainScreen(),
    ScreenPath.AUTH_PATH: (context) => AuthScreen(),
  };
}
