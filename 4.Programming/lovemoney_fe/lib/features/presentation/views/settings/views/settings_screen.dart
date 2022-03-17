import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';

import '../../../../../core/helper/bloc_provider.dart';
import '../../../../../core/util/language/init_language/english.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';
import '../../../global_controllers/user_language_bloc/user_language_event.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UserLanguageBloc? userLanguageBloc = BlocProvider.of(context);
    return Scaffold(
      body: Column(
        children: [
          ListTileLv(
            leading: Column(
              children: [
                TextLv(keyUsedWord: KeyUsedWord.LANGUAGE,),
                Expanded(child: TextLv(keyUsedWord: KeyUsedWord.VIETNAMESE,))
              ],
            ),
            onTap: () {
              userLanguageBloc?.eventController.sink.add(ChangeEnglish(English()));
            },
          ),
        ],
      ),
    );
  }
}