import 'dart:developer';

class RegExpUtil {
  static final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  static final validEmailCharacter = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static bool validatePassword(String? password) {
    if (password == null) {
      log('validate password: ', error: 'password is null');
      return false;
    }
    return validCharacters.hasMatch(password);
  }

  static bool validateEmail(String? email) {
    if (email == null) {
      log('validate email: ', error: 'email is null');
      return false;
    }
    return validEmailCharacter.hasMatch(email);
  }
}