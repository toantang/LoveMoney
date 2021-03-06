// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      sumCost: (json['sumCost'] as num?)?.toDouble(),
      sumCurrentMoney: (json['sumCurrentMoney'] as num?)?.toDouble(),
      expectedFinishDate: json['expectedFinishDate'] == null
          ? null
          : DateTime.parse(json['expectedFinishDate'] as String),
      lastUpdateDate: json['lastUpdateDate'] == null
          ? null
          : DateTime.parse(json['lastUpdatedDate'] as String),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sumCost': instance.sumCost,
      'sumCurrentMoney': instance.sumCurrentMoney,
      'expectedFinishDate': instance.expectedFinishDate?.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'status': instance.status?.toJson(),
      'user': instance.user?.toJson(),
    };
