import 'package:flutter/material.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';

import '../../../../../core/enum/enum_const.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../common_widget/list_tile_lv.dart';
import '../../../common_widget/text_lv.dart';

class InformationTransaction extends StatelessWidget {
  final String title = "COFFEE";

  const InformationTransaction({Key? key}) : super(key: key);

  Widget _buildLine(
      BuildContext context, KeyUsedWord keyUsedWord, String content) {
    return ListTileLv(
      leading: TextLv(keyUsedWord: keyUsedWord),
      title: Text(
        content,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.edit,
        ),
        onPressed: () {

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogLv(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLine(context, KeyUsedWord.COST, '547 547 VND'),
          _buildLine(context, KeyUsedWord.DATE, '03/05/2022'),
          _buildLine(context, KeyUsedWord.NOTE, 'no note'),
        ],
      ),
      actions: [
        ButtonLv(
          onPressed: () {
            Nav.back(context);
          },
          keyUsedWord: KeyUsedWord.BACK,
        ),
      ],
    );
  }
}
