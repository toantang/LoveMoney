import 'package:json_annotation/json_annotation.dart';
import 'package:lovemoney_fe/features/domain/entities/digital_wallet.dart';
import 'package:lovemoney_fe/features/domain/entities/role_user.dart';
import 'package:lovemoney_fe/features/domain/entities/status.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true,)
class User {
  final String? id;
  final DigitalWallet? digitalWallet;
  final String? email;
  final String? password;
  final String? name;
  final UserRole? userRole;
  final int? age;
  final String? salt;
  final DateTime? birthday;
  final String? bio;
  final String? phone;
  final String? gender;
  final String? avatarUrl;
  final Status? status;

  User({
    this.id,
    this.digitalWallet,
    this.email,
    this.password,
    this.name,
    this.userRole,
    this.age,
    this.salt,
    this.birthday,
    this.bio,
    this.phone,
    this.gender,
    this.avatarUrl,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static final User fakeUser = User(
    id: '1',
    email: 'toan123',
    password: '1234',
    userRole: UserRole(
      name: UserRoleName.SINGLE,
      type: UserRoleType.USER,
    ),
    name: 'toantnag',
  );

  User copyWith({
    String? id,
    DigitalWallet? digitalWallet,
    String? email,
    String? password,
    String? name,
    UserRole? userRole,
    int? age,
    String? salt,
    DateTime? birthday,
    String? bio,
    String? phone,
    String? gender,
    String? avatarUrl,
    Status? status,
  }) {
    return User(
      id: id ?? id,
      digitalWallet: digitalWallet ?? this.digitalWallet,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      userRole: userRole ?? this.userRole,
      age: age ?? this.age,
      salt: salt ?? this.salt,
      birthday: birthday ?? this.birthday,
      bio: bio ?? this.bio,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      status: status ?? this.status,
    );
  }
}
