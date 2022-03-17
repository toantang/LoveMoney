import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/views/home/views/home_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/plan/plan_view.dart';
import 'package:lovemoney_fe/features/presentation/views/settings/views/settings_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/transaction/add_transaction.dart';

import '../../../../../core/constant/error_const.dart';
import '../../../../../core/helper/bloc_provider.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../main_bloc/main_bloc.dart';
import '../main_bloc/main_event.dart';
import '../main_bloc/main_state.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Widget> listChild = [
    HomeScreen(),
    AddTransaction(),
    PlanView(),
    SettingScreen()
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final MainBloc homeBloc = MainBloc();

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConst.medialColorConst.white,
      actions: [
        Padding(
          padding:
          const EdgeInsets.only(top: 5, bottom: 5, right: 10),
          child: Container(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: InkWell(
              onTap: () {
                Nav.to(context, ScreenPath.PROFILE_PATH);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/itachi.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
      bottomOpacity: 0.5,
      elevation: 10,
    );
  }

  Widget _bottomNavigationBar(BuildContext context, AsyncSnapshot<ChangeIndexViewState> snapshot) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40)),
      child: BottomNavigationBar(
        currentIndex: snapshot.data!.newIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'new',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_calendar,
            ),
            label: 'plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'settings',
          ),
        ],
        unselectedItemColor: ColorConst.medialColorConst.black,
        selectedItemColor: ColorConst.primaryColorConst.tealShade100,
        showUnselectedLabels: true,
        backgroundColor: ColorConst.secondaryColorConst.redShade400,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          homeBloc.remoteHomeEvent.sink
              .add(ChangeIndexViewEvent(index));
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: homeBloc,
      child: StreamBuilder<ChangeIndexViewState>(
        initialData: homeBloc.changeIndexViewState,
        stream: homeBloc.remoteHomeState.stream,
        builder: (context, AsyncSnapshot<ChangeIndexViewState> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: _appBar(context),
              body: SafeArea(
                child: PageView(
                  children: listChild,
                  controller: _pageController,
                  onPageChanged: (index) {
                    homeBloc.remoteHomeEvent.sink
                        .add(ChangeIndexViewEvent(index));
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.ease);
                  },
                ),
              ),
              bottomNavigationBar: _bottomNavigationBar(context, snapshot),
            );
          } else {
            return const Text(ErrorConst.NULL_STREAM);
          }
        },
      ),
    );
  }
}
