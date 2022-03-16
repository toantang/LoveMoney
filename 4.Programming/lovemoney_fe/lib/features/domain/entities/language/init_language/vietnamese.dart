import 'package:lovemoney_fe/core/enum/enum_const.dart';
import 'package:lovemoney_fe/features/domain/entities/language/used_language.dart';

class Vietnamese extends UsedLanguage {
  @override
  final Map<KeyUsedWord, String> listUsedWords = {
    KeyUsedWord.LOGIN: "Đăng nhập",
    KeyUsedWord.SIGNUP: "Đăng ký",
    KeyUsedWord.DEFAULT: "ko hợp lệ",
    KeyUsedWord.EMAIL: "email",
    KeyUsedWord.PASSWORD: "mật khẩu",
  };
}
