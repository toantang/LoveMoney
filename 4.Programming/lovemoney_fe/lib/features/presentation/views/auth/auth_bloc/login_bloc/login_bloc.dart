import 'dart:async';

import '../../../../../../core/helper/reg_exp.dart';

import '../../../../../../core/helper/bloc_provider.dart';
import '../../../../../../core/helper/remote_event.dart';
import '../../../../../domain/entities/user.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc {
  final EmailLoginBloc emailLoginBloc = EmailLoginBloc();
  final PasswordLoginBloc passwordLoginBloc = PasswordLoginBloc();
  
  User createUser() {
    return User(
      email: emailLoginBloc.emailLoginState.email,
      password: passwordLoginBloc.passwordLoginState.password,
    );
  }
}
class EmailLoginBloc extends BlocBase {
  EmailLoginState emailLoginState = EmailLoginState('');

  final remoteEmailLoginState = StreamController<EmailLoginState>();
  final remoteEmailLoginEvent = StreamController<RemoteEvent>();
  EmailLoginBloc() {
    remoteEmailLoginEvent.stream.listen((RemoteEvent remoteEvent) {
      processEmail(remoteEvent);
    });
  }

  void processEmail(RemoteEvent remoteEvent) {
    if (remoteEvent is EmailLoginEvent) {
      emailLoginState = EmailLoginState(remoteEvent.email);
    }
    remoteEmailLoginState.sink.add(emailLoginState);
  }

  @override
  void dispose() {
  }
}

class PasswordLoginBloc extends BlocBase {
  PasswordLoginState passwordLoginState = PasswordLoginState('');

  final remotePasswordLoginState = StreamController<PasswordLoginState>();
  final remotePasswordLoginEvent = StreamController<RemoteEvent>();
  PasswordLoginBloc() {
    remotePasswordLoginEvent.stream.listen((RemoteEvent remoteEvent) {
      processPassword(remoteEvent);
    });
  }

  void processPassword(RemoteEvent remoteEvent) {
    if (remoteEvent is PasswordLoginEvent) {
      if (RegExpUtil.validatePassword(remoteEvent.password)) {
        passwordLoginState = PasswordLoginState(remoteEvent.password);
      }
      else {
        print('password have special characters or null');
      }
    }
    remotePasswordLoginState.sink.add(passwordLoginState);
  }

  @override
  void dispose() {
  }
}