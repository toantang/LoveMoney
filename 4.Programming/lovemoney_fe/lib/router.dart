import 'package:flutter/material.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/login_form.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/views/profile_screen.dart';

class RouterLV {
  static final Map<String, WidgetBuilder> pages = {
    '/login': (context) {
      return LoginView();
    },
    '/register': (context) {
      return RegisterForm();
    },
    '/profile': (context) {
      return const ProfileScreen();
    },
  };
}
