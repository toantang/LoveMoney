import 'package:json_annotation/json_annotation.dart';

part 'user_language.g.dart';
@JsonSerializable()
class UserLanguage {
  final String? id;
  final String code;
  final String? name;
  final String? description;

  UserLanguage({this.id, required this.code, this.name, this.description});

  UserLanguage copyWith({String? id, required String code, String? name, String? description}) {
    return UserLanguage(
      id: id ?? id,
      code: code,
      name: name ?? name,
      description: description ?? description,
    );
  }
}
