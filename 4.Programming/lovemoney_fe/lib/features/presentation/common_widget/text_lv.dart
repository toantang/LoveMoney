import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import '../../../core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import '../../../core/util/language/used_language.dart';
import '../global_controllers/user_language_bloc/user_language_bloc.dart';
import '../global_controllers/user_language_bloc/user_language_state.dart';

class TextLv extends StatelessWidget {
  final KeyUsedWord keyUsedWord;
  final TextStyle? textStyle;
  const TextLv({
    Key? key,
    required this.keyUsedWord,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextService(
      keyUsedWord: keyUsedWord,
      color: ColorConst.medialColorConst.black,
      textStyle: textStyle,
    );
  }
}

class TextButtonLv extends StatelessWidget {
  final KeyUsedWord keyUsedWord;
  final TextStyle? textStyle;

  const TextButtonLv({
    Key? key,
    required this.keyUsedWord,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextService(
      keyUsedWord: keyUsedWord,
      color: ColorConst.medialColorConst.white,
      textStyle: textStyle,
    );
  }
}

class TextService extends StatelessWidget {
  final KeyUsedWord keyUsedWord;
  final Color? color;
  final TextStyle? textStyle;

  const TextService({
    Key? key,
    required this.keyUsedWord,
    this.color,
    this.textStyle,
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
      builder: (context, AsyncSnapshot<RemoteState> snapshot) {
        if (snapshot.hasData) {
          return Text(_getText(snapshot.data!.usedLanguage), style: textStyle,);
        } else {
          return const Text(ErrorConst.NULL_STREAM);
        }
      },
    );
  }
}
