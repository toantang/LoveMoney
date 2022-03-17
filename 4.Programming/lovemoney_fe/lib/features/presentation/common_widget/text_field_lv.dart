import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_state.dart';

import '../../../core/enum/enum_const.dart';
import '../../../core/helper/bloc_provider.dart';
import '../../../core/util/language/used_language.dart';

class TextFieldLv extends StatelessWidget {
  final TextEditingController textEditingController;
  final KeyUsedWord keyUsedWord;
  final bool? obscureText;
  final TextInputType? textInputType;

  const TextFieldLv({
    Key? key,
    required this.textEditingController,
    required this.keyUsedWord,
    this.obscureText,
    this.textInputType,
  }) : super(key: key);

  String _getText(UsedLanguage usedLanguage) {
    return usedLanguage.getTextByLanguage(keyUsedWord);
  }

  @override
  Widget build(BuildContext context) {
    final UserLanguageBloc? userLanguageBloc = BlocProvider.of(context);

    return StreamBuilder<RemoteState>(
        initialData: userLanguageBloc?.state,
        stream: userLanguageBloc?.stateController.stream,
        builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
          if (snapshot.hasData) {
            return TextField(
              controller: textEditingController,
              obscureText: obscureText?? false,
              keyboardType: textInputType?? TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  hintText: _getText(snapshot.data!.usedLanguage),
                  fillColor: ColorConst.medialColorConst.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            );
          } else {
            return const Text(ErrorConst.NULL_STREAM);
          }
        });
  }
}
