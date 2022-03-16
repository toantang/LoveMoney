import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/domain/entities/language/used_language.dart';

class English extends UsedLanguage {
  @override
  final Map<KeyUsedWord, String> listUsedWords = {
    KeyUsedWord.LOGIN: "LOGIN",
    KeyUsedWord.SIGNUP: "SIGNUP",
    KeyUsedWord.DEFAULT: "no-text",
    KeyUsedWord.EMAIL: "email",
    KeyUsedWord.PASSWORD: "password",
  };
}
