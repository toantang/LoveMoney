import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/navigation_screen.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('register built');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("register"),
            ElevatedButton(
              child: Text('back'),
              onPressed: () {
                Nav.back(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
