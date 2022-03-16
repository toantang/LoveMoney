import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/router.dart';
import 'core/constant/api_const.dart';
import 'core/helper/navigation_screen.dart';

void main() {
  APIConst.setBaseUrl(Enviroment.LOCAL);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RouterLV.pages,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("login view"),
          onPressed: () {
            // Nav.pushTo(context, RegisterForm());
            Nav.to(context, ScreenPath.REGISTER_PATH);
          },
        ),
      ),
    );
  }
}
