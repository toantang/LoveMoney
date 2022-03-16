import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/text_lv.dart';

class ButtonLv extends StatelessWidget {
  final KeyUsedWord keyUsedWord;
  final VoidCallback? onPressed;

  const ButtonLv({Key? key, required this.onPressed, required this.keyUsedWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return ColorConst.secondaryColorConst.redShade400;
        } else {
          return ColorConst.primaryColorConst.greenShade400;
        }
      })),
      child: TextButtonLv(
        keyUsedWord: keyUsedWord,
      ),
    );
  }
}
