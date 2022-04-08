import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';

import '../../../../core/helper/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> nextToScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (await AuthBloc.getInstance().autoLogin()) {
      Nav.back(context);
      Nav.to(context, ScreenPath.HOME_PATH);
    }
    else {
      Nav.back(context);
      Nav.to(context, ScreenPath.AUTH_PATH);
    }
  }
  @override
  void initState(){
    super.initState();
    nextToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 10,
                    child: const LinearProgressIndicator(),
                  ),
                  const Text("Loading..."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
