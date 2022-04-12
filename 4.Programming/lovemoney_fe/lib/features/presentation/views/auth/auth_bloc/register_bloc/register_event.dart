
import '../../../../../../core/util/remote_event.dart';

class EmailRegisterEvent extends RemoteEvent {
  final String email;
  EmailRegisterEvent(this.email);
}

class PasswordRegisterEvent extends RemoteEvent {
  final String password;
  PasswordRegisterEvent(this.password);
}

class NameRegisterEvent extends RemoteEvent {
  final String name;
  NameRegisterEvent(this.name);
}

class ConfirmRegisterEvent extends RemoteEvent {
  final String confirmPassword;
  ConfirmRegisterEvent(this.confirmPassword);
}