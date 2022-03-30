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
      expectedFinishDate: json['expectedFinishDate'] as String?,
      lastUpdatedDate: json['lastUpdatedDate'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sumCost': instance.sumCost,
      'sumCurrentMoney': instance.sumCurrentMoney,
      'expectedFinishDate': instance.expectedFinishDate,
      'lastUpdatedDate': instance.lastUpdatedDate,
      'status': instance.status?.toJson(),
      'user': instance.user?.toJson(),
    };
