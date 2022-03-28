import 'package:json_annotation/json_annotation.dart';

part 'role_user.g.dart';

@JsonSerializable()
class UserRole {
  final String? type;
  final String? name;

  UserRole({this.type, this.name});

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$RoleUserFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleToJson(this);

  UserRole copyWith({String? type, String? name}) {
    return UserRole(
      type: type ?? type,
      name: name ?? name,
    );
  }
}

class UserRoleType {
  static const String USER = 'User';
  static const String ADMIN = 'Admin';
}
class UserRoleName {
  static const String STUDENT = 'Student';
  static const String SINGLE = 'Single';
  static const String NORMAL_PERSON = 'Normal_person';

}
