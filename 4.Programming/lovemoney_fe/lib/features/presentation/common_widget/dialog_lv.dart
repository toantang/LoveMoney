import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';

class NavDialog {
  static void show(BuildContext context, Widget alertDialog) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return alertDialog;
        }
    );
  }
}

class DialogLv extends StatelessWidget {
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;

  const DialogLv({Key? key, this.title, this.content, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: title,
      ),
      content: content,
      actions: actions,
      alignment: Alignment.center,
    );
  }
}

class CustomDialog {
  void showDialog(BuildContext context, Widget child) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: ColorConst.medialColorConst.black.withOpacity(0.5),
      //transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
