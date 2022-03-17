import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/router.dart';
import 'core/constant/api_const.dart';
import 'features/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';
import 'features/presentation/views/main/views/main_screen.dart';

void main() {
  APIConst.setBaseUrl(Enviroment.LOCAL);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserLanguageBloc userLanguageBloc = UserLanguageBloc();

    return BlocProvider(
      bloc: userLanguageBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorConst.primaryColorConst.blueShade200,
        ),
        routes: RouterLV.pages,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final UserLanguageBloc userLanguageBloc = UserLanguageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColorConst.blueShade200,
      body: MainScreen(),
      /*body: Center(
        child: ElevatedButton(
          child: const Text("login view"),
          onPressed: () {
            Nav.to(context, ScreenPath.LOGIN_PATH,);
          },
        ),
      ),*/
    );
  }
}
