// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      userRole: json['userRole'] == null
          ? null
          : UserRole.fromJson(json['userRole'] as Map<String, dynamic>),
      age: json['age'] as int?,
      salt: json['salt'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      bio: json['bio'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'userRole': instance.userRole?.toJson(),
      'age': instance.age,
      'salt': instance.salt,
      'birthday': instance.birthday?.toIso8601String(),
      'bio': instance.bio,
      'phone': instance.phone,
      'gender': instance.gender,
      'avatarUrl': instance.avatarUrl,
      'status': instance.status?.toJson(),
    };
