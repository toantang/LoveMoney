import 'dart:async';

import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/auth_repository_impl.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/login_bloc/login_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/register_bloc/register_bloc.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

import '../../../../../core/helper/bloc_provider.dart';
import '../../../../data/shared_preferences/authentication_storage.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc {
  static final AuthBloc authBloc = AuthBloc();
  final RegisterBloc _registerBloc = RegisterBloc();
  final LoginBloc _loginBloc = LoginBloc();
  final AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();

  late String _loginStatus;

  User _user = User();

  AuthBloc() {
    _user = User.fakeUser;
    _loginStatus = LoginStatus.LOGIN_FAILED;
  }

  Future<bool> register() async {
    ApiResponse<User>? apiResponse =
        await _authRepositoryImpl.signUp(user: _registerBloc.createUser());
    User? user = apiResponse?.result?.data;
    print(user.toString());
    if (user != null) {
      return true;
    }
    return false;
  }

  Future<bool> login() async {
    ApiResponse<User>? apiResponse =
        await _authRepositoryImpl.login(user: _loginBloc.createUser());
    User? user = apiResponse?.result?.data;
    if (user != null) {
      _user = user;
      await _authenticationStorage.updateLoginInfo(
          email: user.email, password: user.password,);
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    LoginInfo? loginInfor = await _authenticationStorage.getLoginInfo();
    print(loginInfor.toString());
    if (loginInfor != null) {
      ApiResponse<User>? apiResponse = await _authRepositoryImpl.autoLogin(
          user: User(
              email: loginInfor.loginEmail,
              ),);
      User? user = apiResponse?.result?.data;
      if (user != null) {
        _user = user;
        _loginStatus = LoginStatus.LOGIN_SUCCESS;
        return true;
      }
    }
    return false;
  }

  String get loginStatus => _loginStatus;

  static AuthBloc getInstance() => authBloc;

  RegisterBloc get registerBloc => _registerBloc;

  LoginBloc get loginBloc => _loginBloc;

  User get user => _user;
}

class LoginStatus {
  static const String LOGIN_SUCCESS = "login success";
  static const String LOGIN_FAILED = "login failed";
}

class ChangeAuthBloc extends BlocBase {
  ChangeIndexAuthViewState changeIndexViewState = ChangeIndexAuthViewState(0);

  final remoteHomeState = StreamController<ChangeIndexAuthViewState>();
  final remoteHomeEvent = StreamController<RemoteEvent>();

  MainBloc() {
    remoteHomeEvent.stream.listen((RemoteEvent remoteEvent) {
      _changeIndexCurrentView(remoteEvent);
    });
  }

  void _changeIndexCurrentView(RemoteEvent remoteEvent) {
    if (remoteEvent is ChangeIndexAuthViewEvent) {
      changeIndexViewState = ChangeIndexAuthViewState(
        remoteEvent.index,
      );
    }
    remoteHomeState.sink.add(changeIndexViewState);
  }

  @override
  void dispose() {}
}
