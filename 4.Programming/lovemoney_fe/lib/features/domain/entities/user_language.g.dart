// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) => UserLanguage(
      id: json['_id'] as String?,
      code: json['code'] as String,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserLanguageToJson(UserLanguage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
    };
