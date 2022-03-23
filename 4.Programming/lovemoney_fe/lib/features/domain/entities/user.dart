import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/digital_wallet.dart';
import 'package:lovemoney_fe/features/domain/entities/role_user.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

part 'user.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String? id;
  final DigitalWallet? digitalWallet;
  final String? email;
  final String? password;
  final String? name;
  final RoleUser? roleUser;
  final int? age;
  final String? salt;
  final DateTime? birthday;
  final String? bio;
  final String? phone;
  final String? gender;
  final String? avatarUrl;
  final Status? status;

  User(
      {this.id,
      this.digitalWallet,
      this.email,
      this.password,
      this.name,
      this.roleUser,
      this.age,
      this.salt,
      this.birthday,
      this.bio,
      this.phone,
      this.gender,
      this.avatarUrl,
      this.status});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith(
      {String? id,
      DigitalWallet? digitalWallet,
      String? email,
      String? password,
      String? name,
      RoleUser? roleUser,
      int? age,
      String? salt,
      DateTime? birthday,
      String? bio,
      String? phone,
      String? gender,
      String? avatarUrl,
      Status? status}) {
    return User(
      id: id ?? id,
      digitalWallet: digitalWallet ?? digitalWallet,
      email: email ?? email,
      password: password ?? password,
      name: name ?? name,
      roleUser: roleUser ?? roleUser,
      age: age ?? age,
      salt: salt ?? salt,
      birthday: birthday ?? birthday,
      bio: bio ?? bio,
      phone: phone ?? phone,
      gender: gender ?? gender,
      avatarUrl: avatarUrl ?? avatarUrl,
      status: status ?? status,
    );
  }
}
