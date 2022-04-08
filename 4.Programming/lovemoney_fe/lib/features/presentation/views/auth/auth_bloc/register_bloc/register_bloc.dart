import 'dart:async';

import 'package:lovemoney_fe/core/helper/bloc_provider.dart';
import 'package:lovemoney_fe/core/helper/remote_event.dart';
import 'package:lovemoney_fe/features/domain/entities/user.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/register_bloc/register_event.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/register_bloc/register_state.dart';

class RegisterBloc {
  final EmailRegisterBloc emailRegisterBloc = EmailRegisterBloc();
  final PasswordRegisterBloc passwordRegisterBloc = PasswordRegisterBloc();
  final NameRegisterBloc nameRegisterBloc = NameRegisterBloc();
  final ConfirmRegisterBloc confirmRegisterBloc = ConfirmRegisterBloc();

  User createUser() {
    return User(
      email: emailRegisterBloc.emailRegisterState.email,
      password: passwordRegisterBloc.passwordRegisterState.password,
      name: nameRegisterBloc.nameRegisterState.name,
    );
  }
}

class EmailRegisterBloc extends BlocBase {
  EmailRegisterState emailRegisterState = EmailRegisterState('');

  final remoteEmailRegisterState = StreamController<EmailRegisterState>();
  final remoteEmailRegisterEvent = StreamController<RemoteEvent>();
  EmailRegisterBloc() {
    remoteEmailRegisterEvent.stream.listen((RemoteEvent remoteEvent) {
      processEmail(remoteEvent);
    });
  }

  void processEmail(RemoteEvent remoteEvent) {
    if (remoteEvent is EmailRegisterEvent) {
      emailRegisterState = EmailRegisterState(remoteEvent.email);
    }
    remoteEmailRegisterState.sink.add(emailRegisterState);
  }

  @override
  void dispose() {
  }
}

class PasswordRegisterBloc extends BlocBase {
  PasswordRegisterState passwordRegisterState = PasswordRegisterState('');

  final remotePasswordRegisterState = StreamController<PasswordRegisterState>();
  final remotePasswordRegisterEvent = StreamController<RemoteEvent>();
  PasswordRegisterBloc() {
    remotePasswordRegisterEvent.stream.listen((RemoteEvent remoteEvent) {
      processPassword(remoteEvent);
    });
  }

  void processPassword(RemoteEvent remoteEvent) {
    if (remoteEvent is PasswordRegisterEvent) {
      passwordRegisterState = PasswordRegisterState(remoteEvent.password);
    }
    remotePasswordRegisterState.sink.add(passwordRegisterState);
  }

  @override
  void dispose() {
  }
}

class NameRegisterBloc extends BlocBase {
  NameRegisterState nameRegisterState = NameRegisterState('');

  final remoteNameRegisterState = StreamController<NameRegisterState>();
  final remoteNameRegisterEvent = StreamController<RemoteEvent>();
  NameRegisterBloc() {
    remoteNameRegisterEvent.stream.listen((RemoteEvent remoteEvent) {
      processName(remoteEvent);
    });
  }

  void processName(RemoteEvent remoteEvent) {
    if (remoteEvent is NameRegisterEvent) {
      nameRegisterState = NameRegisterState(remoteEvent.name);
    }
    remoteNameRegisterState.sink.add(nameRegisterState);
  }

  @override
  void dispose() {
  }
}

class ConfirmRegisterBloc extends BlocBase {
  ConfirmRegisterState confirmRegisterState = ConfirmRegisterState('');

  final remoteConfirmRegisterState = StreamController<ConfirmRegisterState>();
  final remoteConfirmRegisterEvent = StreamController<RemoteEvent>();
  ConfirmRegisterBloc() {
    remoteConfirmRegisterEvent.stream.listen((RemoteEvent remoteEvent) {
      processConfirmPassword(remoteEvent);
    });
  }

  void processConfirmPassword(RemoteEvent remoteEvent) {
    if (remoteEvent is ConfirmRegisterEvent) {
      confirmRegisterState = ConfirmRegisterState(remoteEvent.confirmPassword);
    }
    remoteConfirmRegisterState.sink.add(confirmRegisterState);
  }

  @override
  void dispose() {
  }
}