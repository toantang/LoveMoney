import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_view.dart';

import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        children: [
          Card(
            child: ListTileLv(
              leading: Column(
                children: const [
                  TextLv(
                    keyUsedWord: KeyUsedWord.LANGUAGE,
                  ),
                  Expanded(
                    child: TextLv(
                      keyUsedWord: KeyUsedWord.CURRENT_LANGUAGE,
                    ),
                  )
                ],
              ),
              onTap: () {
                NavDialog.show(context, SelectedLanguage());
                /*userLanguageBloc?.eventController.sink
                  .add(ChangeEnglish(English()));*/
              },
            ),
          ),
        ],
      ),
    );
  }
}

