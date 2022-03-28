// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      digitalWallet: json['digital_wallet'] == null
          ? null
          : DigitalWallet.fromJson(
              json['digital_wallet'] as Map<String, dynamic>),
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      userRole: json['user_role'] == null
          ? null
          : UserRole.fromJson(json['user_role'] as Map<String, dynamic>),
      age: json['age'] as int?,
      salt: json['salt'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      bio: json['bio'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'digital_wallet': instance.digitalWallet,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'user_role': instance.userRole,
      'age': instance.age,
      'salt': instance.salt,
      'birthday': instance.birthday?.toIso8601String(),
      'bio': instance.bio,
      'phone': instance.phone,
      'gender': instance.gender,
      'avatar_url': instance.avatarUrl,
      'status': instance.status,
    };
