import 'dart:async';

import '../../../../../core/helper/bloc_provider.dart';
import '../../../../../core/helper/remote_event.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';

class AuthBloc {
  static final AuthBloc authBloc = AuthBloc();

  User _user = User();

  AuthBloc() {
    _user = User.fakeUser;
  }

  final EmailBloc emailBloc = EmailBloc();
  final PasswordBloc passwordBloc = PasswordBloc();

  static AuthBloc getInstance() => authBloc;
  User get user => _user;
}

class EmailBloc extends BlocBase {
  EmailNotificationState emailNotificationState = EmailNotificationState('unknown');

  final remoteEmailEvent = StreamController<RemoteEvent>();
  final remoteEmailState = StreamController<EmailNotificationState>();

  EmailBloc() {
    remoteEmailEvent.stream.listen((RemoteEvent remoteEvent) {
      processInputEmail(remoteEvent);
    });
  }

  void processInputEmail(RemoteEvent remoteEvent) {
    if (remoteEvent is InputEmail) {

    }
    remoteEmailState.sink.add(emailNotificationState);
  }
  @override
  void dispose() {
    remoteEmailEvent.close();
    remoteEmailState.close();
  }

}

class PasswordBloc extends BlocBase {
  PasswordNotificationState passwordNotificationState = PasswordNotificationState('unknown');

  final remotePasswordState = StreamController<PasswordNotificationState>();
  final remotePasswordEvent = StreamController<RemoteEvent>();

  PasswordBloc() {
    remotePasswordEvent.stream.listen((RemoteEvent remoteEvent) {
      processInputPassword(remoteEvent);
    });
  }

  void processInputPassword(RemoteEvent remoteEvent) {
    if (remoteEvent is InputEmail) {

    }
    remotePasswordState.sink.add(passwordNotificationState);
  }
  @override
  void dispose() {
    remotePasswordState.close();
    remotePasswordEvent.close();
  }
}
