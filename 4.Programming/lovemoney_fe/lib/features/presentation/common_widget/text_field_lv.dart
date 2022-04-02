import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/core/helper/format_text_to_number.dart';
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
  final int? maxLines;
  final int? maxLength;
  final String? countText;
  final bool? enabled;

  TextFieldLv({
    Key? key,
    required this.textEditingController,
    required this.keyUsedWord,
    this.obscureText,
    this.textInputType,
    this.maxLines,
    this.maxLength,
    this.countText,
    this.enabled,
  }) : super(key: key);

  final FormatTextToNumber formatTextToNumber = FormatTextToNumber();

  String _getText(UsedLanguage usedLanguage) {
    return usedLanguage.getTextByLanguage(keyUsedWord);
  }

  bool _checkInputNumber() {
    if (textInputType.hashCode ==
            const TextInputType.numberWithOptions(signed: true).hashCode ||
        textInputType.hashCode ==
            const TextInputType.numberWithOptions().hashCode) {
      return true;
    }
    return false;
  }

  void dispose() {
    textEditingController.dispose();
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
            obscureText: obscureText ?? false,
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLines,
            maxLength: maxLength,
            enabled: enabled ?? true,
            onChanged: (value) {
              if (_checkInputNumber()) {
                textEditingController.text =
                    formatTextToNumber.changeText(value);
                textEditingController.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: textEditingController.text.length,
                  ),
                );
              }
            },
            decoration: InputDecoration(
              filled: true,
              hintText: _getText(snapshot.data!.usedLanguage),
              fillColor: ColorConst.medialColorConst.white,
              counterText: countText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          );
        } else {
          return const Text(ErrorConst.NULL_STREAM);
        }
      },
    );
  }
}
