import 'dart:async';

import 'package:lovemoney_fe/core/constant/error_const.dart';
import 'package:lovemoney_fe/core/error/custom_error.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/user_repository_impl.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_event.dart';
import 'package:lovemoney_fe/features/presentation/views/profile_screen/update_user_bloc/update_user_state.dart';

import '../../../../../core/helper/bloc_provider.dart';
import '../../../../../core/util/remote_event.dart';
import '../../../../domain/entities/user.dart';

class UpdateUserBloc {
  final User user;
  final UserRepositoryImpl _userRepositoryImpl = UserRepositoryImpl();

  late final UpdateNameBloc updateNameBloc;
  late final UpdatePasswordBloc updatePasswordBloc;
  late final UpdateBioBloc updateBioBloc;
  late final UpdateGenderBloc updateGenderBloc;
  late final UpdateConfirmPasswordBloc updateConfirmPasswordBloc;

  UpdateUserBloc({required this.user}) {
    updateNameBloc = UpdateNameBloc(currentName: user.name!);
    updatePasswordBloc = UpdatePasswordBloc(currentPass: user.password!);
    updateConfirmPasswordBloc = UpdateConfirmPasswordBloc(currentPass: user.password!);
    updateBioBloc = UpdateBioBloc(currentBio: user.bio);
    updateGenderBloc = UpdateGenderBloc(currentGender: user.gender);
  }

  bool validateConfirmPassword() {
    String pass = updatePasswordBloc.updatePasswordState.newPassword;
    String confirmPass = updateConfirmPasswordBloc.updateConfirmPasswordState.confirmPassword;
    if (pass == confirmPass) {
      return true;
    }
    return false;
  }
  Future<CustomError> updateUser() async {
    if (!validateConfirmPassword()) {
      return CustomError(code: ErrorCode.FAILED, name: ErrorConst.INVALID_CONFIRM_PASSWORD);
    }
    User _user = user.copyWith(
      email: user.email!,
      name: updateNameBloc.updateNameState.newName,
      password: updatePasswordBloc.updatePasswordState.newPassword,
      gender: updateGenderBloc.updateGenderState.gender,
      bio: updateBioBloc.updateBioState.bio,
    );

    AuthBloc.getInstance().updateUser(_user);
    ApiResponse<User>? apiResponse = await _userRepositoryImpl.updateUser(user: _user);
    User? resUser = apiResponse?.result?.data;
    if (resUser == null) {
      return CustomError(code: ErrorCode.FAILED, name: ErrorConst.UPDATE_USER_FAILED);
    }
    return CustomError(code: ErrorCode.FAILED, name: ErrorConst.UPDATE_USER_SUCCESS);
  }
}

class UpdateNameBloc extends BlocBase {
  final String currentName;
  late UpdateNameState _updateNameState;

  final StreamController<RemoteEvent> remoteUpdateNameEvent = StreamController();
  final StreamController<UpdateNameState> remoteUpdateNameState= StreamController();

  UpdateNameBloc({required this.currentName}) {
    _updateNameState = UpdateNameState(newName: currentName);
    remoteUpdateNameEvent.stream.listen((RemoteEvent remoteEvent) {
      _processNewName(remoteEvent);
    });
  }

  void _processNewName(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateNameEvent) {
      _updateNameState = UpdateNameState(newName: remoteEvent.newName);
    }
    remoteUpdateNameState.sink.add(_updateNameState);
  }

  @override
  void dispose() {

  }

  UpdateNameState get updateNameState => _updateNameState;

  set updateNameState(UpdateNameState value) {
    _updateNameState = value;
  }
}

class UpdatePasswordBloc extends BlocBase {
  final String currentPass;
  late UpdatePasswordState _updatePasswordState;

  final StreamController<RemoteEvent> remoteUpdatePasswordEvent = StreamController();
  final StreamController<UpdatePasswordState> remoteUpdatePasswordState = StreamController();

  UpdatePasswordBloc({required this.currentPass}) {
    _updatePasswordState = UpdatePasswordState(newPassword: currentPass);
    remoteUpdatePasswordEvent.stream.listen((RemoteEvent remoteEvent) {
      _processNewName(remoteEvent);
    });
  }

  void _processNewName(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdatePasswordEvent) {
      _updatePasswordState = UpdatePasswordState(newPassword: remoteEvent.newPassword);
    }
    remoteUpdatePasswordState.sink.add(_updatePasswordState);
  }

  @override
  void dispose() {

  }

  UpdatePasswordState get updatePasswordState => _updatePasswordState;

  set updatePasswordState(UpdatePasswordState value) {
    _updatePasswordState = value;
  }
}

class UpdateConfirmPasswordBloc extends BlocBase {
  final String currentPass;
  late UpdateConfirmPasswordState _updateConfirmPasswordState;

  final StreamController<RemoteEvent> remoteUpdateConfirmPasswordEvent = StreamController();
  final StreamController<UpdateConfirmPasswordState> remoteUpdateConfirmPasswordState = StreamController();

  UpdateConfirmPasswordBloc({required this.currentPass}) {
    _updateConfirmPasswordState = UpdateConfirmPasswordState(confirmPassword: currentPass);
    remoteUpdateConfirmPasswordEvent.stream.listen((RemoteEvent remoteEvent) {
      _processConfirmPassword(remoteEvent);
    });
  }

  void _processConfirmPassword(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateConfirmPasswordEvent) {
      _updateConfirmPasswordState = UpdateConfirmPasswordState(confirmPassword: remoteEvent.confirmPassword);
    }
    remoteUpdateConfirmPasswordState.sink.add(_updateConfirmPasswordState);
  }

  @override
  void dispose() {

  }

  UpdateConfirmPasswordState get updateConfirmPasswordState => _updateConfirmPasswordState;

  set updatePasswordState(UpdateConfirmPasswordState value) {
    _updateConfirmPasswordState = value;
  }
}

class UpdateBioBloc extends BlocBase {
  final String? currentBio;
  late UpdateBioState _updateBioState;
  final StreamController<UpdateBioState> remoteUpdateBioState = StreamController();
  final StreamController<UpdateBioEvent> remoteUpdateBioEvent = StreamController();

  UpdateBioBloc({this.currentBio}) {
    _updateBioState = UpdateBioState(bio: currentBio?? '');
    remoteUpdateBioEvent.stream.listen((event) { });
  }

  void _processNewBio(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateBioEvent) {
      _updateBioState = UpdateBioState(bio: remoteEvent.bio);
    }
    remoteUpdateBioState.sink.add(_updateBioState);
  }

  @override
  void dispose() {

  }

  UpdateBioState get updateBioState => _updateBioState;

  set updateBioState(UpdateBioState value) {
    _updateBioState = value;
  }
}

class UpdateGenderBloc extends BlocBase {
  final String? currentGender;
  late UpdateGenderState _updateGenderState;
  final StreamController<UpdateGenderState> remoteUpdateGenderState = StreamController();
  final StreamController<RemoteEvent> remoteUpdateGenderEvent = StreamController();

  UpdateGenderBloc({this.currentGender}) {
    _updateGenderState = UpdateGenderState(gender: currentGender?? '');
    remoteUpdateGenderEvent.stream.listen((RemoteEvent remoteEvent) {
      _processNewGender(remoteEvent);
    });
  }

  void _processNewGender(RemoteEvent remoteEvent) {
    if (remoteEvent is UpdateGenderEvent) {
      _updateGenderState = UpdateGenderState(gender: remoteEvent.gender);
    }
    remoteUpdateGenderState.sink.add(_updateGenderState);
  }
  @override
  void dispose() {

  }

  UpdateGenderState get updateGenderState => _updateGenderState;

  set updateGenderState(UpdateGenderState value) {
    _updateGenderState = value;
  }
}