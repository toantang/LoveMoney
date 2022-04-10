import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_event.dart';
import 'package:lovemoney_fe/features/presentation/views/user/user_bloc/user_state.dart';

class UserBloc extends BlocBase {
  UserState _userState = UserState(user: AuthBloc.getInstance().user);
  late bool closedStream;
  //final StreamController<UserState> remoteUserState = StreamController();
  //final StreamController<RemoteEvent> remoteUserEvent = StreamController();
  late StreamController<UserState> remoteUserState;
  late StreamController<RemoteEvent> remoteUserEvent;

  UserBloc() {
    openStream();
    remoteUserEvent.stream.listen((RemoteEvent remoteEvent) {
      _processUser(remoteEvent);
    });
  }

  void openStream() {
    remoteUserState = StreamController();
    remoteUserEvent = StreamController();
    closedStream = false;
  }
  void _processUser(RemoteEvent remoteEvent) {
    if (remoteEvent is NewUserEvent) {
      _userState = UserState(user: remoteEvent.newUser);
    }
    remoteUserState.sink.add(_userState);
  }

  @override
  void dispose() {
    remoteUserState.close();
    remoteUserEvent.close();
    closedStream = true;
  }

  UserState get userState => _userState;
}