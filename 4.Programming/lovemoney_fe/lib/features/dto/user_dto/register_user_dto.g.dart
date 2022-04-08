// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserDto _$RegisterUserDtoFromJson(Map<String, dynamic> json) =>
    RegisterUserDto(
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RegisterUserDtoToJson(RegisterUserDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
    };
