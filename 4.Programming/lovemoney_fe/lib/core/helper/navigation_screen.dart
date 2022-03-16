import 'package:flutter/material.dart';

class Nav {
  /*final BuildContext context;
  final String pathScreen;
  Nav({required this.context, required this.pathScreen});*/

  static Future<T?> to<T extends Object?>(BuildContext context, String path) {
    return Navigator.pushNamed(context, path);
  }

  static void back<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context);
  }

  static Future<T?> pushTo<T extends Object?>(
      BuildContext context, Widget screen) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen));
  }
}