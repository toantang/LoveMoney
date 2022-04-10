import 'package:flutter/material.dart';

import '../../../core/helper/navigation_screen.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final bool? onWillPop;
  final bool? resizeToAvoidBottomInset;

  const BaseScreen(
      {Key? key,
      required this.body,
      this.onWillPop,
      this.resizeToAvoidBottomInset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onWillPop == null) {
          return true;
        }
        return onWillPop!;
      },
      child: Scaffold(
        body: body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      ),
    );
  }
}

class BaseScreenWithBack extends StatelessWidget {
  final bool? resizeToAvoidBottomInset;
  final Widget body;
  final bool? onWillPop;

  const BaseScreenWithBack(
      {Key? key,
      this.resizeToAvoidBottomInset,
      this.onWillPop,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onWillPop == null) {
          return true;
        }
        return onWillPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Nav.back(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
          ),
        ),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        body: body,
      ),
    );
  }
}
