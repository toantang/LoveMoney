import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';

import '../../common_widget/list_tile_lv.dart';
import '../../common_widget/text_lv.dart';

class InfoItem extends StatelessWidget {
  final KeyUsedWord keyUsedWord;
  final String content;

  const InfoItem({
    Key? key,
    required this.keyUsedWord,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileLv(
      leading: TextLv(keyUsedWord: keyUsedWord),
      title: Text(
        content,
      ),
    );
  }
}
