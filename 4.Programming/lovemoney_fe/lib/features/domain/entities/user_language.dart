import 'package:json_annotation/json_annotation.dart';

part 'user_language.g.dart';

@JsonSerializable()
class UserLanguage {
  final String? id;
  final String code;
  final String? name;
  final String? description;

  UserLanguage({this.id, required this.code, this.name, this.description});

  factory UserLanguage.fromJson(Map<String, dynamic> json) =>
      _$UserLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$UserLanguageToJson(this);

  factory UserLanguage.vietnamese() => UserLanguage(
        code: LanguageCode.vietnamese,
        name: "VIETNAMESE",
        description: "sử dụng tiếng việt",
      );

  factory UserLanguage.english() => UserLanguage(
      code: LanguageCode.english,
      name: "ENGLISH",
      description: "using english");

  UserLanguage copyWith(
      {String? id, required String code, String? name, String? description}) {
    return UserLanguage(
      id: id ?? id,
      code: code,
      name: name ?? name,
      description: description ?? description,
    );
  }
}

class LanguageCode {
  static const String vietnamese = "vi";
  static const String english = "en";
}
