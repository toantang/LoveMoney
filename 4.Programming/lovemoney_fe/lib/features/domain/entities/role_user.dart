import 'package:json_annotation/json_annotation.dart';

part 'role_user.g.dart';

@JsonSerializable()
class RoleUser {
  final String? type;
  final String? name;

  RoleUser({this.type, this.name});

  factory RoleUser.fromJson(Map<String, dynamic> json) =>
      _$RoleUserFromJson(json);

  Map<String, dynamic> toJson() => _$RoleUserToJson(this);

  RoleUser copyWith({String? type, String? name}) {
    return RoleUser(
      type: type ?? type,
      name: name ?? name,
    );
  }
}
