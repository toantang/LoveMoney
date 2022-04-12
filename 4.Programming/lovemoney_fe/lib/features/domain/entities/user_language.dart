import 'package:json_annotation/json_annotation.dart';

part 'user_language.g.dart';

@JsonSerializable(explicitToJson: true,)
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
      id: id ?? this.id,
      code: this.code,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class LanguageCode {
  static const String vietnamese = "vi";
  static const String english = "en";
}
