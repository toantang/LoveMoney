

class AuthBloc {

}
/*class AuthBloc extends BlocBase {

  final EmailNotification emailNotification = EmailNotification('unknown');
  final PasswordNotification passwordNotification = PasswordNotification('unknown');

  final remoteEvent = StreamController<RemoteEvent>();
  final emailController = StreamController<InputEmail>();
  final passController = StreamController<InputPassword>();

  AuthBloc() {
    remoteEvent.stream.listen((RemoteEvent remoteEvent) {
      input(remoteEvent);
    });
  }

  void input(RemoteEvent remoteEvent) {
    if (remoteEvent is InputEmail) {

    }
    else if (remoteEvent is InputPassword) {

    }
    else {

    }
  }
  @override
  void dispose() {
  }
}*/