import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/list_tile_lv.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_lv.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildLine(BuildContext context, KeyUsedWord keyUsedWord, String content) {
    return ListTileLv(
      leading: TextLv(keyUsedWord: keyUsedWord),
      title: Text(
        content,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.edit,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          const SizedBox(
            width: 150,
            height: 150,
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/itachi.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                size: 30,
                color: ColorConst.medialColorConst.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithBack(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _avatar(context),
          _buildLine(context, KeyUsedWord.NAME, 'Tang The Toan'),
          _buildLine(context, KeyUsedWord.EMAIL, 'toant123@gmail.con'),
          _buildLine(context, KeyUsedWord.PASSWORD, '*********'),
          _buildLine(context, KeyUsedWord.BIO,
              'fasdgsfgateggtdhtyjhtgrftjyhgrfrgtaehteyahbtbfdggetaghadgfgfsgh'),
          _buildLine(context, KeyUsedWord.GENDER, 'gender'),
        ],
      ),
    );
  }
}
