import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';

class ListTileLv extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? subTitle;
  final Widget? title;
  final Function()? onTap;
  final KeyUsedWord? keyUsedWord;

  const ListTileLv(
      {Key? key,
      this.leading,
      this.trailing,
      this.onTap,
      this.subTitle,
      this.title,
      this.keyUsedWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      subtitle: subTitle,
      title: title,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      dense: true,
    );
  }
}
