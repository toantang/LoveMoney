import 'dart:developer';

class RegExpUtil {
  static final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  static bool validatePassword(String? password) {
    if (password == null) {
      log('validate password: ', error: 'password is null');
      return false;
    }
    return validCharacters.hasMatch(password);
  }
}