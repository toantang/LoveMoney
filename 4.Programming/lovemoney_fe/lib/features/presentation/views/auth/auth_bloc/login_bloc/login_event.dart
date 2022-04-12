import '../../../../../../core/util/remote_event.dart';

class EmailLoginEvent extends RemoteEvent {
  final String email;
  EmailLoginEvent(this.email);
}

class PasswordLoginEvent extends RemoteEvent {
  final String password;
  PasswordLoginEvent(this.password);
}