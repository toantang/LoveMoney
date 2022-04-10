import 'package:flutter/cupertino.dart';
import 'package:lovemoney_fe/features/presentation/common_widget/dialog_lv.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/bio_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/name_field.dart';
import 'package:lovemoney_fe/features/presentation/medium_widget/text_field_widget/password_field.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_event.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_state.dart';
import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_event.dart';
import '../../../../core/enum/enum_const.dart';
import '../../../../core/helper/navigation_screen.dart';
import '../../common_widget/button_lv.dart';
import '../user/user_bloc/user_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key, required this.updateUserBloc}) : super(key: key);

  final UpdateUserBloc updateUserBloc;
  final TextEditingController ecName = TextEditingController();
  final TextEditingController ecBio = TextEditingController();
  final TextEditingController ecPassword = TextEditingController();

  void _defaultText() {
    ecName.text = updateUserBloc.updateNameBloc.updateNameState.newName;
    ecBio.text = updateUserBloc.updateBioBloc.updateBioState.bio ?? '';
    ecPassword.text = updateUserBloc.updatePasswordBloc.updatePasswordState.newPassword;
  }

  void _onChangeInfoButton() {
    updateUserBloc.updateNameBloc.updateNameState = UpdateNameState(newName: ecName.text);
    updateUserBloc.updateBioBloc.updateBioState = UpdateBioState(bio: ecBio.text);
    updateUserBloc.updatePasswordBloc.updatePasswordState = UpdatePasswordState(newPassword: ecPassword.text);

    updateUserBloc.updateNameBloc.remoteUpdateNameEvent.sink.add(UpdateNameEvent(newName: ecName.text));
    updateUserBloc.updateBioBloc.remoteUpdateBioEvent.sink.add(UpdateBioEvent(bio: ecBio.text));
    updateUserBloc.updatePasswordBloc.remoteUpdatePasswordEvent.sink.add(UpdatePasswordEvent(newPassword: ecPassword.text));

    updateUserBloc.updateUser();
  }

  @override
  Widget build(BuildContext context) {
    _defaultText();
    final UserBloc userBloc = BlocProvider.of(context)!;

    return AlertDialogLv(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NameField(ecName: ecName),
          PasswordField(ecPassword: ecPassword),
          BioField(ecBio: ecBio),
        ],
      ),
      actions: [
        ButtonLv(
          onPressed: () {
            _onChangeInfoButton();
            userBloc.remoteUserEvent.sink.add(NewUserEvent(newUser: AuthBloc.getInstance().user));
            Nav.back(context);
          },
          keyUsedWord: KeyUsedWord.CONFIRM,
        ),
        ButtonLv(
          onPressed: () {
            Nav.back(context);
          },
          keyUsedWord: KeyUsedWord.BACK,
        ),
      ],
    );
  }
}