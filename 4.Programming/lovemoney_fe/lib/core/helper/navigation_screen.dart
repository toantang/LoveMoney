import 'package:flutter/material.dart';

class Nav {
  static Future<T?> to<T extends Object?>(BuildContext context, String path,
      {Object? arguments}) {
    return Navigator.pushNamed(context, path, arguments: arguments);
  }

  static void back<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }

  static Future<T?> pushTo<T extends Object?>(
      BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
