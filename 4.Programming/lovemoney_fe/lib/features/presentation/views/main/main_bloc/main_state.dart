import 'package:flutter/cupertino.dart';

class ChangeIndexViewState {
  final int newIndex;
  final List<Widget>? listChild; // listChild in PageView, if you want to rebuild child in PageView, use it
  ChangeIndexViewState(this.newIndex, {this.listChild});
}