import 'package:flutter/material.dart';

class ListTileLv extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? subTitle;
  final Widget? title;
  final Function()? onTap;

  const ListTileLv({Key? key, this.leading, this.trailing, this.onTap, this.subTitle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      subtitle: subTitle,
      title: title,
    );
  }
}
