import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_event.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_state.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/login_form.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/register_form.dart';

class AuthScreen extends StatelessWidget {

  final List<Widget> listChild = [
    LoginView(),
    RegisterForm(),
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final ChangeAuthBloc changeAuthBloc = ChangeAuthBloc();

  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      body: SafeArea(
        child: BlocProvider(
          bloc: changeAuthBloc,
          child: StreamBuilder<ChangeIndexAuthViewState>(
            initialData: changeAuthBloc.changeIndexViewState,
            stream: changeAuthBloc.remoteHomeState.stream,
            builder: (context, snapshot) {
              return PageView(
                children: listChild,
                controller: _pageController,
                onPageChanged: (index) {
                  changeAuthBloc.remoteHomeEvent.sink.add(ChangeIndexAuthViewEvent(index));
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
