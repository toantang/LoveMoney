import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_bloc/select_language_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/select_language/select_language_view.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_bloc.dart';

import '../../../../../core/helper/bloc_provider.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../../../main.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget _changeLanguageButton(BuildContext context) {
    return Card(
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
          NavDialog.show(context, const SelectedLanguage());
        },
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Card(
      child: ListTileLv(
        leading: const TextLv(
          keyUsedWord: KeyUsedWord.LOGOUT,
        ),
        onTap: () {
          Nav.back(context);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        children: [
          _changeLanguageButton(context),
          _logout(context),
        ],
      ),
    );
  }
}

