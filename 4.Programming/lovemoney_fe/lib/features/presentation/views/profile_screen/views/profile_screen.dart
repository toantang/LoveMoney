import 'package:flutter/material.dart';
import 'package:lovemoney_fe/core/constant/color_const.dart';
import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/base_screen.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/button_lv.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/edit_profile_screen.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_state.dart';
import '../../../../../core/helper/navigation_screen.dart';
import '../../../../../core/util/screen_path.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_bloc.dart';

import '../../../medium_widget/info_item_widget/info_item.dart';

class ProfileScreen extends StatelessWidget {
  final UpdateUserBloc updateUserBloc;

  const ProfileScreen({Key? key, required this.updateUserBloc})
      : super(key: key);

  Widget _avatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            const SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/itachi.jpg'),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: ColorConst.medialColorConst.white,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoName(BuildContext context) {
    return BlocProvider(
      child: StreamBuilder<UpdateNameState>(
        initialData: updateUserBloc.updateNameBloc.updateNameState,
        stream: updateUserBloc.updateNameBloc.remoteUpdateNameState.stream,
        builder: (context, snapshot) {
          return InfoItem(
            keyUsedWord: KeyUsedWord.NAME,
            content: snapshot.data?.newName ?? "",
          );
        },
      ),
      bloc: updateUserBloc.updateNameBloc,
    );
  }

  Widget _infoPassword(BuildContext context) {
    return BlocProvider(
      child: StreamBuilder<UpdatePasswordState>(
        initialData: updateUserBloc.updatePasswordBloc.updatePasswordState,
        stream:
            updateUserBloc.updatePasswordBloc.remoteUpdatePasswordState.stream,
        builder: (context, snapshot) {
          int lenPass = snapshot.data?.newPassword.length ?? 0;
          String pass = '';
          for (int i = 0; i < lenPass; i++) {
            pass = pass + '*';
          }
          return InfoItem(
            keyUsedWord: KeyUsedWord.PASSWORD,
            content: pass,
          );
        },
      ),
      bloc: updateUserBloc.updatePasswordBloc,
    );
  }

  Widget _infoBio(BuildContext context) {
    return BlocProvider(
      child: StreamBuilder<UpdateBioState>(
        initialData: updateUserBloc.updateBioBloc.updateBioState,
        stream: updateUserBloc.updateBioBloc.remoteUpdateBioState.stream,
        builder: (context, snapshot) {
          return InfoItem(
            keyUsedWord: KeyUsedWord.BIO,
            content: snapshot.data?.bio ?? '',
          );
        },
      ),
      bloc: updateUserBloc.updateBioBloc,
    );
  }

  Widget _infoGender(BuildContext context) {
    return BlocProvider(
      child: StreamBuilder<UpdateGenderState>(
        initialData: updateUserBloc.updateGenderBloc.updateGenderState,
        stream: updateUserBloc.updateGenderBloc.remoteUpdateGenderState.stream,
        builder: (context, snapshot) {
          return InfoItem(
            keyUsedWord: KeyUsedWord.GENDER,
            content: snapshot.data?.gender ?? '',
          );
        },
      ),
      bloc: updateUserBloc.updateGenderBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithBack(
      body: Column(
        children: [
          _avatar(context),
          _infoName(context),
          InfoItem(
            keyUsedWord: KeyUsedWord.EMAIL,
            content: updateUserBloc.user.email ?? '',
          ),
          _infoPassword(context),
          _infoBio(context),
          _infoGender(context),
          ButtonLv(
            onPressed: () {
              Nav.to(context, ScreenPath.EDIT_PROFILE_PATH, arguments: updateUserBloc);
            },
            keyUsedWord: KeyUsedWord.EDIT,
          )
        ],
      ),
    );
  }
}
