import 'package:lovemoney_fe/core/helper/remote_event.dart';

class InputEmail extends RemoteEvent {
  final String? email;
  InputEmail(this.email);
}

class InputPassword extends RemoteEvent {
  final String? password;
  InputPassword(this.password);
}