import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_field_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/update_transaction_bloc/update_transaction_bloc.dart';

import '../../../core/helper/navigation_screen.dart';
import '../views/transaction/update_transaction_bloc/update_transaction_event.dart';

class NavDialog {
  void function(String value) {}

  static dynamic show(
      BuildContext context, Widget alertDialog, {UpdateTransactionBloc? updateTransactionBloc}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return alertDialog;
        });
  }
}

class AlertDialogLv extends StatelessWidget {
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;

  const AlertDialogLv({Key? key, this.title, this.content, this.actions})
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

class AlertDialogLvUpdate extends StatelessWidget {
  final Widget? title;
  final KeyUsedWord keyUsedWord;
  final TextEditingController textEditingController = TextEditingController();
  final VoidCallback? update;
  final String? contentTextField;

  AlertDialogLvUpdate({
    Key? key,
    this.title,
    required this.keyUsedWord,
    this.contentTextField,
    this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textEditingController.text = contentTextField ?? '';

    return AlertDialog(
      title: Center(
        child: title,
      ),
      content: TextFieldLv(
        keyUsedWord: keyUsedWord,
        textEditingController: textEditingController,
      ),
      actions: [
        ButtonLv(
          onPressed: () {
            Nav.back(context, contentTextField);
          },
          keyUsedWord: KeyUsedWord.CANCEL,
        ),
        ButtonLv(
          onPressed: () {
            Nav.back(context, textEditingController.text);
          },
          keyUsedWord: KeyUsedWord.OK,
        ),
      ],
    );
  }
}

