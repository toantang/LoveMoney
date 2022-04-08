import 'package:flutter/cupertino.dart';

class ChangeIndexAuthViewState {
  final int newIndex;
  final List<Widget>? listChild; // listChild in PageView, if you want to rebuild child in PageView, use it
  ChangeIndexAuthViewState(this.newIndex, {this.listChild});
}

