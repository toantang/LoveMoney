import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/core/util/language/init_language/vietnamese.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_event.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_state.dart';

import '../../../../../../core/enum/enum_const.dart';
import '../../../../../../core/helper/bloc_provider.dart';
import '../../../../../../core/helper/navigation_screen.dart';
import '../../../../../../core/util/language/init_language/english.dart';
import '../../../../common_widget/text_lv.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';

import '../../../../global_controllers/user_language_bloc/user_language_event.dart';

class SelectedLanguage extends StatelessWidget {
  const SelectedLanguage({Key? key}) : super(key: key);

  void _selectVietnamese(
    SelectLanguageBloc selectLanguageBloc,
    UserLanguageBloc? userLanguageBloc,
  ) {
    selectLanguageBloc.remoteSelectLanguageEvent.sink
        .add(SelectVietnameseEvent(KeyUsedWord.VIETNAMESE));
    userLanguageBloc?.eventController.sink.add(ChangeVietnamese(Vietnamese()));
  }

  void _selectEnglish(
    SelectLanguageBloc selectLanguageBloc,
    UserLanguageBloc? userLanguageBloc,
  ) {
    selectLanguageBloc.remoteSelectLanguageEvent.sink
        .add(SelectEnglishEvent(KeyUsedWord.ENGLISH));
    userLanguageBloc?.eventController.sink.add(ChangeEnglish(English()));
  }

  Widget _content(
    BuildContext context,
    SelectLanguageBloc selectLanguageBloc,
    UserLanguageBloc? userLanguageBloc,
  ) {
    return StreamBuilder<SelectLanguageState>(
        initialData: selectLanguageBloc.selectLanguageState,
        stream: selectLanguageBloc.remoteSelectLanguageState.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const TextLv(keyUsedWord: KeyUsedWord.VIETNAMESE),
                  leading: Radio<KeyUsedWord>(
                    value: KeyUsedWord.VIETNAMESE,
                    groupValue: snapshot.data!.keyUsedWord,
                    onChanged: (KeyUsedWord? value) {
                      _selectVietnamese(selectLanguageBloc, userLanguageBloc);
                    },
                  ),
                  onTap: () {
                    _selectVietnamese(selectLanguageBloc, userLanguageBloc);
                  },
                ),
                ListTile(
                  title: const TextLv(keyUsedWord: KeyUsedWord.ENGLISH),
                  leading: Radio<KeyUsedWord>(
                    value: KeyUsedWord.ENGLISH,
                    groupValue: snapshot.data!.keyUsedWord,
                    onChanged: (KeyUsedWord? value) {
                      _selectEnglish(selectLanguageBloc, userLanguageBloc);
                    },
                  ),
                  onTap: () {
                    _selectEnglish(selectLanguageBloc, userLanguageBloc);
                  },
                ),
              ],
            );
          } else {
            return const Text(ErrorConst.NULL_STREAM);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final UserLanguageBloc? userLanguageBloc = BlocProvider.of(context);
    final SelectLanguageBloc selectLanguageBloc = SelectLanguageBloc(
        userLanguageBloc?.state.usedLanguage ?? Vietnamese());

    return BlocProvider(
      child: AlertDialogLv(
        title: const TextLv(keyUsedWord: KeyUsedWord.LANGUAGE),
        content: _content(context, selectLanguageBloc, userLanguageBloc),
        actions: [
          ButtonLv(
            onPressed: () {
              Nav.back(context);
            },
            keyUsedWord: KeyUsedWord.BACK,
          ),
        ],
      ),
      bloc: selectLanguageBloc,
    );
  }
}
