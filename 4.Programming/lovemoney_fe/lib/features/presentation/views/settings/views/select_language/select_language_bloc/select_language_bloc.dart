import 'dart:async';

import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/core/util/language/init_language/vietnamese.dart';
import 'package:lovemoney_fe/core/util/language/used_language.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_event.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_state.dart';

import '../../../../../../../core/util/language/init_language/english.dart';

class SelectLanguageBloc extends BlocBase {
  SelectLanguageState selectLanguageState =
      SelectLanguageState(KeyUsedWord.VIETNAMESE);

  final remoteSelectLanguageState = StreamController<SelectLanguageState>();
  final remoteSelectLanguageEvent = StreamController<RemoteEvent>();

  SelectLanguageBloc(UsedLanguage usedLanguage) {
    if (usedLanguage is Vietnamese) {
      selectLanguageState = SelectLanguageState(KeyUsedWord.VIETNAMESE);
    } else if (usedLanguage is English) {
      selectLanguageState = SelectLanguageState(KeyUsedWord.ENGLISH);
    } else {
      selectLanguageState = SelectLanguageState(KeyUsedWord.VIETNAMESE);
    }

    remoteSelectLanguageEvent.stream.listen((RemoteEvent remoteEvent) {
      changeSelect(remoteEvent);
    });
  }

  void changeSelect(RemoteEvent remoteEvent) {
    if (remoteEvent is SelectVietnameseEvent) {
      selectLanguageState = SelectLanguageState(KeyUsedWord.VIETNAMESE);
    } else if (remoteEvent is SelectEnglishEvent) {
      selectLanguageState = SelectLanguageState(KeyUsedWord.ENGLISH);
    } else {
      selectLanguageState = SelectLanguageState(KeyUsedWord.VIETNAMESE);
    }

    remoteSelectLanguageState.sink.add(selectLanguageState);
  }

  @override
  void dispose() {
    remoteSelectLanguageEvent.close();
    remoteSelectLanguageState.close();
  }
}
